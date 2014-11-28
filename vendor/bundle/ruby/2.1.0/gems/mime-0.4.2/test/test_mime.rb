gem 'minitest'  # minitest in 1.9 stdlib is crufty
require 'minitest/autorun'
require 'mime'

Encoding.default_external = 'ASCII-8BIT'  # may be able to remove in 2.0


class MIMETest < Minitest::Test

  CRLF = "\r\n"
  BINARY_DATA = '0110000101110101011001000110100101101111' 

  ID_SPEC = '\w+@[\w.-]+'
  DATE_SPEC = '..., \d{1,2} ... \d{4} \d\d:\d\d:\d\d -\d{4}'
  VERSION_SPEC = '\(Ruby MIME v\d\.\d\.\d\)'
  BOUNDARY_SPEC = 'Boundary_\w+'


  ### RFC 822 MESSAGE CONSTRUCTION ###

  def test_rfc822_message
    msg = MIME::Mail.new('message body')
    headers, body = msg.to_s.split(CRLF*2)

    assert_match(/^Message-ID: <#{ID_SPEC}>/, headers)
    assert_match(/^Date: #{DATE_SPEC}/, headers)
    assert_match(/^MIME-Version: 1.0 #{VERSION_SPEC}/, headers)
    assert_match(/^Content-ID: <#{ID_SPEC}>/, headers)
    assert_match(/^Content-Type: text\/plain/, headers)
    assert_equal 5, headers.split(CRLF).count
    assert_equal 'message body', body
  end

  def test_rfc822_message_with_empty_body
    assert_match(/#{VERSION_SPEC}#{CRLF*2}$/, MIME::Mail.new.to_s)
  end

  def test_rfc822_message_with_discrete_media_body
    email = MIME::Mail.new
    email.to = {
      'john@example.com' => 'John',
      'paul@example.com' => nil,
      'mary@example.com' => 'Mary'
    }
    email.cc = {'boss@example.com' => 'Head Honcho'}
    email.from = 'jane@example.com'
    email.subject = 'This is an important email'
    email.body = MIME::Text.new('Hello, world!')
    assert_equal_mime_msg 'rfc822_discrete', email
  end

  def test_rfc822_message_with_composite_media_body
    img = MIME::DiscreteMediaFactory.create(sd('ruby.png'))
    img.transfer_encoding = 'binary'

    htm_msg = MIME::Text.new(<<EOF, 'html', 'charset' => 'iso-8859-1')
<html>
  <body><img alt="cool ruby" src="cid:#{img.id}"></body>
</html>
EOF
    related_htm_msg = MIME::Multipart::Related.new
    related_htm_msg.add(htm_msg)
    related_htm_msg.inline(img)

    txt_msg = MIME::Text.new(<<EOF, 'plain', 'charset' => 'us-ascii')
Check the attachment for a cool ruby picture.
EOF
    mixed_txt_msg = MIME::Multipart::Mixed.new
    mixed_txt_msg.add(txt_msg)
    mixed_txt_msg.attach(img)

    alt_msg = MIME::Multipart::Alternative.new
    alt_msg.add(mixed_txt_msg)
    alt_msg.add(related_htm_msg)

    email = MIME::Mail.new(alt_msg)
    email.from = 'john@example.com'
    email.to   = 'jane@example.com'
    email.subject = 'Cool ruby pic'

    assert_equal_mime_msg 'rfc822_composite', email
  end


  ### DISCRETE MESSAGE CONSTRUCTION (SINGLE ENTITY) ###

  def test_audio_message
    audio_media = MIME::Audio.new(BINARY_DATA, 'midi')
    audio_media.transfer_encoding = 'binary'
    assert_equal_mime_msg 'audio', audio_media
  end

  def test_application_message
    app_media = MIME::Application.new(BINARY_DATA)
    app_media.transfer_encoding = 'binary'
    assert_equal_mime_msg 'application', app_media
  end

  def test_image_message
    image = IO.read(sd('image.jpg'))
    image_media = MIME::Image.new(image)
    image_media.transfer_encoding = 'binary'
    assert_equal_mime_msg 'image', image_media
  end

  def test_text_message
    text_media = MIME::Text.new('a plain text message')
    assert_equal_mime_msg 'text', text_media
  end

  def test_video_message
    video_media = MIME::Video.new(BINARY_DATA)
    video_media.transfer_encoding = 'binary'
    assert_equal_mime_msg 'video', video_media
  end


  ### COMPOSITE MESSAGE CONSTRUCTION (MULTIPLE ENTITIES) ###

  def test_multipart_form_data_with_text_entities
    txt_data = 'text body'
    htm_data = IO.read(sd('data.htm'))
    xml_data = IO.read(sd('data.xml'))

    txt = MIME::Text.new(txt_data)
    htm = MIME::Text.new(htm_data, 'html')
    xml = MIME::Text.new(xml_data, 'xml')

    form = MIME::Multipart::FormData.new
    form.add xml, 'xml'
    form.add htm, 'htm'
    form.add txt, 'txt'
    assert_equal_mime_msg 'multipart_form_data_text', form
  end

  def test_multipart_form_data_with_text_and_file_entities
    img1_filename = 'image.jpg'
    img2_filename = 'ruby.png'
    img1_data = IO.read(sd(img1_filename))
    img2_data = IO.read(sd(img2_filename))
    img1 = MIME::Image.new(img1_data, 'jpeg')
    img2 = MIME::Image.new(img2_data, 'png')
    img1.transfer_encoding = '8bit'
    img2.transfer_encoding = '8bit'

    desc_data = 'This is plain text description of images.'
    desc = MIME::Text.new(desc_data, 'plain', 'charset' => 'us-ascii')

    form = MIME::Multipart::FormData.new
    form.add img1, 'image_1', img1_filename
    form.add img2, 'image_2', img2_filename
    form.add desc, 'description'
    assert_equal_mime_msg 'multipart_form_data_file_and_text', form
  end

  # Similar to example 6 in RFC1867.
  def test_multipart_form_data_with_mixed_entity
    txt = MIME::Text.new('Joe Blow')
    img1 = MIME::DiscreteMediaFactory.create(sd('image.jpg'))
    img2 = MIME::DiscreteMediaFactory.create(sd('ruby.png'))

    mixed_msg = MIME::Multipart::Mixed.new
    mixed_msg.attach(img1)
    mixed_msg.attach(img2)

    form = MIME::Multipart::FormData.new
    form.add(txt, 'field1')
    form.add(mixed_msg, 'pics')

    assert_equal_mime_msg 'multipart_form_data_mixed', form
  end

  def test_multipart_alternative_message
    txt_data = "*Header*\nmessage"
    htm_data = "<html><body><h1>Header</h1><p>message</p></body></html>"
    txt_msg = MIME::Text.new(txt_data, 'enhanced', 'charset' => 'us-ascii')
    htm_msg = MIME::Text.new(htm_data, 'html', 'charset' => 'iso-8859-1')

    msg = MIME::Multipart::Alternative.new
    msg.add txt_msg
    msg.add htm_msg
    assert_equal_mime_msg 'multipart_alternative', msg
  end

  def test_multipart_alternative_with_related_html_entity
    img = MIME::DiscreteMediaFactory.create(sd('ruby.png'))
    img.transfer_encoding = 'binary'

    html_msg = MIME::Text.new(<<EOF, 'html', 'charset' => 'iso-8859-1')
<html>
<body>
  <h1>HTML multipart/alternative message</h1>
  <p>txt before pix</p>
  <img alt="cool ruby" src="cid:#{img.id}"/>
  <p>txt after pix</p>
</body>
</html>
EOF
    html_msg.transfer_encoding = '7bit'

    text_msg = MIME::Text.new(<<EOF, 'plain', 'charset' => 'us-ascii')
*HTML multipart/alternative message*
txt before pix
<cool ruby image>
txt after pix
EOF
    text_msg.transfer_encoding = '7bit'

    related_msg = MIME::Multipart::Related.new
    related_msg.add(html_msg)
    related_msg.inline(img)

    msg = MIME::Multipart::Alternative.new
    msg.add(text_msg)
    msg.add(related_msg)
    assert_equal_mime_msg 'multipart_alternative_related', msg
  end

  def test_multipart_mixed_with_inline_and_attachment
    msg = MIME::Multipart::Mixed.new
    msg.inline(MIME::Text.new('Plain Text'))

    open(sd('image.jpg')) do |img_file|
      img_data = img_file.read
      img_msg = MIME::Image.new(img_data, 'jpeg')
      msg.attach(img_msg, 'filename' => img_file.path)
    end

    assert_equal_mime_msg 'multipart_mixed_inline_and_attachment', msg
  end

  def test_multipart_mixed_message_using_media_factory
    bot_img = MIME::DiscreteMediaFactory.create(sd('image.jpg'))
    top_img = MIME::DiscreteMediaFactory.create(sd('ruby.png'))
    top_txt = MIME::DiscreteMediaFactory.create(sd('data.htm'))

    msg = MIME::Multipart::Mixed.new
    msg.inline(top_txt)
    msg.attach(top_img)
    msg.attach(bot_img)
    assert_equal_mime_msg 'multipart_mixed_inline_and_attachment2', msg
  end

  def test_multipart_related_html_message_with_embedded_image
    img = MIME::DiscreteMediaFactory.create(sd('/ruby.png'))
    img.transfer_encoding = 'binary'

    html_msg = MIME::Text.new(<<EOF, 'html; charset=iso-8859-1')
<html>
<body>
  <h1>HTML multipart/related message</h1>
  <p>
    txt before pix
    <img alt="cool ruby" src="cid:#{img.id}">
  </p>
  <p>txt after pix</p>
</body>
</html>
EOF
    html_msg.transfer_encoding = '7bit'

    msg = MIME::Multipart::Related.new
    msg.add(html_msg)
    msg.inline(img)
    assert_equal_mime_msg 'multipart_related', msg
  end


  ### GENERAL RFC ADHERENCE ###

  def test_boundary_format
    form = MIME::Multipart::FormData.new
    %w(one two three four).each do |ent|
      form.add(MIME::Text.new(ent), ent)
    end

    boundary = form.to_s.scan(/--Boundary_.*\r\n/).each
    first_boundary = boundary.next
    assert_equal first_boundary, boundary.next
    assert_equal first_boundary, boundary.next
    assert_equal first_boundary, boundary.next
    refute_equal first_boundary, (last_boundary = boundary.next)
    assert_match(/^--#{BOUNDARY_SPEC}\r\n/, first_boundary)
    assert_match(/^--#{BOUNDARY_SPEC}--\r\n/, last_boundary)
  end

  def test_message_id_auto_generation
    msg = MIME::Mail.new
    assert_nil(msg.message_id)
    msg.to_s
    assert_match(/^#{ID_SPEC}$/, msg.message_id)
  end

  def test_message_id_manual_assignment
    msg_id = 'id_1234@example.com'
    msg = MIME::Mail.new
    assert_nil(msg.message_id)
    msg.message_id = msg_id
    assert_equal("#{msg_id}", msg.message_id)
    msg.to_s  # should not affect message ID
    assert_equal("#{msg_id}", msg.message_id)
  end

  def test_sender_field_auto_generation
    msg = MIME::Mail.new
    msg.from = addresses = %w(john@example.com jane@example.com)
    assert_nil msg.sender
    msg.to_s   # add sender header when multiple from addresses
    assert_equal addresses.first, msg.sender
  end

  def test_sender_field_manual_assignment
    msg = MIME::Mail.new
    msg.from = %w(john@example.com jane@example.com)
    assert_nil msg.sender
    msg.sender = sender = 'jack@example.com'
    assert_equal sender, msg.sender
    msg.to_s  # should not affect sender header
    assert_equal sender, msg.sender
  end

  def test_rfc2822_date_format
    msg = MIME::Mail.new
    assert_kind_of(Time, msg.date)
    assert_match(/^Date: #{msg.date.rfc2822}\r\n/, msg.to_s)
    hour_ago = Time.now() - 3600
    msg.date = hour_ago
    assert_match(/^Date: #{hour_ago.rfc2822}\r\n/, msg.to_s)
    msg.date += 3600
    refute_match(/^Date: #{hour_ago.rfc2822}\r\n/, msg.to_s)
  end

  def test_unique_content_ids_in_multipart_message
    form = MIME::Multipart::FormData.new
    %w(one two three four).each do |ent|
      form.add(MIME::Text.new(ent), ent)
    end

    # 5 IDs: main header ID + 4 entity IDs
    content_ids = form.to_s.scan(/^Content-ID: <(#{ID_SPEC})>/)
    assert_equal 5, content_ids.flatten.uniq.count  # IDs must be unique
  end

  def test_content_disposition_filenames
    filename1 = 'book.pdf'
    filename2 = 'mini.mov'
    filename3 = 'song.mp3'
    filename4 = 'none.txt'
    filename5 = 'none.htm'
    file1 = MIME::DiscreteMediaFactory.create(sd filename1)
    file2 = MIME::DiscreteMediaFactory.create(sd filename2)
    file3 = MIME::DiscreteMediaFactory.create(sd filename3)
    file4 = MIME::Text.new('txt')
    file5 = MIME::Text.new('htm')
    file6 = MIME::Text.new('xml')

    form = MIME::Multipart::FormData.new
    # file backed objects
    form.add file1, 'file_1'                      # none
    form.add file2, 'file_2', filename2           # relative
    form.add file3, 'file_3', "/tmp/#{filename3}" # absolute
    # non-file backed objects
    form.add file4, 'file_4', "/tmp/#{filename4}" # absolute
    form.add file5, 'file_5', filename5           # relative
    form.add file6, 'file_6'                      # none
    msg = form.to_s
    hdr = 'Content-Disposition: form-data;'

    # only the file basename should be assigned to filename, never a path
    assert_match(/^#{hdr} name=file_1; filename=#{filename1}\r\n/, msg)
    assert_match(/^#{hdr} name=file_2; filename=#{filename2}\r\n/, msg)
    assert_match(/^#{hdr} name=file_3; filename=#{filename3}\r\n/, msg)
    assert_match(/^#{hdr} name=file_4; filename=#{filename4}\r\n/, msg)
    assert_match(/^#{hdr} name=file_5; filename=#{filename5}\r\n/, msg)
    assert_match(/^#{hdr} name=file_6\r\n/, msg)
  end

  # According to RFC 2822, "multiple occurrences of any of the fields" is
  # "obsolete field syntax" and "interpretation of multiple occurrences of
  # fields is unspecified."
  def test_case_insenstive_header_names
    headers = MIME::Header.new
    headers.set    'from', 'user1'
    assert_equal   'from: user1', headers.to_s
    headers.set    'FROM', 'user1'
    assert_equal   'FROM: user1', headers.to_s
    headers.set    'From', 'user2'
    assert_equal   'From: user2', headers.to_s
    headers.delete 'fROM'
    assert_equal   '', headers.to_s
  end

  def test_header_field_removal_via_set_nil
    headers = MIME::Header.new
    headers.set    'a', 'b'
    assert_equal   'b', headers.get('a')
    headers.set    'a', nil
    assert_nil     headers.get('a')
  end

  def test_header_field_removal_via_delete
    headers = MIME::Header.new
    headers.set    'a', 'b'
    assert_equal   'b', headers.get('a')
    headers.delete 'a'
    assert_nil     headers.get('a')
  end

  def test_mailbox_types
    e1 = 'john@example.com'
    e2 = 'jane@example.com'
    to = "#{e1}, #{e2}"
    mb_string = to
    mb_array = [e1, e2]
    mb_hash = {e1 => nil, e2 => nil}
    msg = MIME::Mail.new
    msg.to = mb_string; assert_equal to, msg.headers.get('to')
    msg.to = mb_array;  assert_equal to, msg.headers.get('to')
    msg.to = mb_hash;   assert_equal to, msg.headers.get('to')
  end

  def test_mailbox_display_names
    non_alnum = "!$&*-=^`|~#%+/?_{}'"
    email = 'john@example.com'
    msg = MIME::Mail.new
    mailboxes = [
      {email => nil},                     # no display name
      {email => %[A #{non_alnum} Z]},     # non-special chars
      {email => %[John]},                 # one atom
      {email => %[John Doe]},             # two atoms
      {email => %[John "Dead Man" Doe]},  # special: double quote
      {email => %[John D. Doe]},          # special: period
      {email => %[John Doe, DECEASED]}    # special: comma
    ]
    expected = [
      email,
      %[A #{non_alnum} Z <#{email}>],
      %[John <#{email}>],
      %[John Doe <#{email}>],
      %["John \\\"Dead Man\\\" Doe" <#{email}>],
      %["John D. Doe" <#{email}>],
      %["John Doe, DECEASED" <#{email}>]
    ]
    expected.each_with_index do |exp, i|
      msg.to = mailboxes[i]
      assert_equal exp, msg.headers.get('to')
    end
  end

  def test_sender_field_specification
    e1 = 'john@example.com'
    e2 = 'jane@example.com'
    msg = MIME::Mail.new

    # sender must contain a single mailbox
    assert_raises(ArgumentError) {msg.sender = [e1, e2]}
    assert_raises(ArgumentError) {msg.sender = {e1=>nil, e2=>nil}}
    msg.sender = [e1];      assert_equal e1, msg.headers.get('sender')
    msg.sender = {e1=>nil}; assert_equal e1, msg.headers.get('sender')
  end

  # Quoted Strings: https://tools.ietf.org/html/rfc5322#section-3.2.4
  def test_content_disposition_parameter_quoting
    txt = MIME::Text.new('')
    value_test_cases = {
      '123' => '123',
      'abc' => 'abc',
      'a.c' => 'a.c',
      '{b}' => '{b}',
      '.bc' => '".bc"', # quote leading period
      '[b]' => '"[b]"', # quote string
      'a c' => '"a c"', # unless DOT_ATOM
      'a"c' => '"a\"c"' # escape double quote
    }
    value_test_cases.each do |value, expected|
      txt.__send__(:set_disposition, 'type', 'param' => value)
      assert_equal "type; param=#{expected}", txt.disposition
    end
  end


  ### LIBRARY OPERATION ###

  def test_no_instantiation_of_abstract_classes
    e = MIME::AbstractClassError
    assert_raises(e) {MIME::Media.new(nil, nil, nil)}
    assert_raises(e) {MIME::DiscreteMedia.new(nil, nil, nil)}
    assert_raises(e) {MIME::CompositeMedia.new(nil)}
    assert_raises(e) {MIME::Multipart.new(nil)}
  end

  def test_content_type_detection
    (o = Object.new).extend(MIME::ContentTypes)

    # test file extension; file path is irrelevant here
    assert_equal 'application/pdf',          o.file_type('a.pdf')
    assert_equal 'video/quicktime',          o.file_type('b.mov')
    assert_equal 'application/octet-stream', o.file_type('c.iso')
    assert_equal 'audio/mpeg',               o.file_type('/d/e.mp3')
    assert_equal 'text/css',                 o.file_type('/f/g/h.css')
    assert_equal nil,                        o.file_type('i.nil')

    # test using file object
    img_type = open(sd('ruby.png')) {|f| o.file_type(f)}
    assert_equal 'image/png',  img_type
    refute_equal 'image/jpeg', img_type
  end

  def test_object_instantiation_using_discrete_media_factory
    app_file     = sd('book.pdf')
    audio_file   = sd('song.mp3')
    text_file    = sd('data.xml')
    video_file   = sd('mini.mov')
    image_file   = sd('image.jpg')
    unknown_file = sd('unknown.yyy')

    dmf = MIME::DiscreteMediaFactory

    # test using file path
    assert_kind_of MIME::Application, dmf.create(app_file)
    assert_kind_of MIME::Audio,       dmf.create(audio_file)
    assert_kind_of MIME::Text,        dmf.create(text_file)
    assert_kind_of MIME::Video,       dmf.create(video_file)
    assert_kind_of MIME::Image,       dmf.create(image_file)

    # test using file object
    open(image_file) do |image_file_obj|
      assert_kind_of MIME::Image, dmf.create(image_file_obj)
    end
    open(text_file) do |text_file_obj|
      assert_kind_of MIME::Text, dmf.create(text_file_obj)
    end

    # raise for unknown file path and File object
    assert_raises(MIME::UnknownContentError) {dmf.create(unknown_file)}
    open(unknown_file) do |unknown_file_obj|
      assert_raises(MIME::UnknownContentError) {dmf.create(unknown_file_obj)}
    end
  end

  def test_discrete_media_factory_with_specified_invalid_conent_type
    invalid_ctype1 = 'application-x/pdf'
    invalid_ctype2 = 'application'
    invalid_ctype3 = ''
    valid_ctype    = 'application/pdf'
    pdf = sd('book.pdf')

    assert_raises(MIME::UnknownContentError) {
      MIME::DiscreteMediaFactory.create(pdf, invalid_ctype1)
    }
    assert_raises(MIME::UnknownContentError) {
      MIME::DiscreteMediaFactory.create(pdf, invalid_ctype2)
    }
    assert_raises(MIME::UnknownContentError) {
      MIME::DiscreteMediaFactory.create(pdf, invalid_ctype3)
    }
    assert MIME::DiscreteMediaFactory.create(pdf, valid_ctype)
  end

  def test_discrete_media_factory_creates_path_singleton_method
    pdf_file_path = sd('book.pdf')

    media_obj = MIME::DiscreteMediaFactory.create(pdf_file_path)
    assert_equal pdf_file_path, media_obj.path

    open(pdf_file_path) do |pdf_file_obj|
      media_obj = MIME::DiscreteMediaFactory.create(pdf_file_obj)
      assert_equal pdf_file_path, media_obj.path
    end
  end

  def test_content_id
    txt = MIME::Text.new('body')        # CID generated on initialize

    cid1 = txt.id.dup
    assert_match(/^#{ID_SPEC}$/, cid1)
    assert_includes(txt.to_s, cid1)     # to_s should not change CID
    assert_equal(cid1, txt.id)

    txt.id = cid2 = 'id@example.com'
    refute_equal(cid1, txt.id)
    assert_equal(cid2, txt.id)
    assert_includes(txt.to_s, cid2)
  end


  private

  #
  # Test equality of the +expected+ and +actual+ MIME messages.
  #
  def assert_equal_mime_msg expected, actual
    m1 = generalize_msg(IO.read(sd(expected+'.msg')))
    m2 = generalize_msg(actual.to_s)
    assert_equal m1, m2
  end

  #
  # Remove unique identifiers to make +message+ structurally comparable.
  #
  def generalize_msg message
    id       = /-ID: <#{ID_SPEC}>#{CRLF}/
    cid      = /cid:#{ID_SPEC}/
    date     = /^Date: #{DATE_SPEC}#{CRLF}/
    version  = /#{VERSION_SPEC}#{CRLF}/
    boundary = /#{BOUNDARY_SPEC}/

    message.
      gsub(id,       "-ID: <ID-REMOVED>#{CRLF}").
      gsub(cid,      "cid:ID-REMOVED").
      sub(date,      "Date: DATE-REMOVED#{CRLF}").
      sub(version,   "(Ruby MIME v0.0.0)#{CRLF}").
      gsub(boundary, "Boundary_ID-REMOVED")
  end

  #
  # Return the path of the scaffold +file+.
  #
  def sd file
    File.join(File.dirname(__FILE__), 'scaffold', file)
  end

end
