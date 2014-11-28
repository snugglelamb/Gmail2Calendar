gem 'minitest'  # minitest in 1.9 stdlib is crufty
require 'minitest/autorun'
require 'mime'

class TextFlowedTest < Minitest::Test

  include MIME::ContentFormats

  def test_empty_string
    assert_equal '', TextFlowed.encode('')
  end

  def test_single_word_will_not_break_regardless_of_line_length
    txt = "1234567890"
    assert_equal txt, TextFlowed.encode(txt, 9)   # <
    assert_equal txt, TextFlowed.encode(txt, 10)  # =
    assert_equal txt, TextFlowed.encode(txt, 11)  # >
  end

  def test_max_line_length_around_first_word
    txt       = "1234567890 A"
    expected1 = "1234567890\r\nA"
    expected2 = "1234567890 \r\nA"
    assert_equal expected1, TextFlowed.encode(txt, 9)   # <
    assert_equal expected1, TextFlowed.encode(txt, 10)  # =
    assert_equal expected2, TextFlowed.encode(txt, 11)  # >
  end

  def test_words_with_variable_spacing
    txt       = "123  456   789"
    expected1 = "123  \r\n456   \r\n789"
    expected2 = "123  456 \r\n789"
    expected3 = "123  456  \r\n789"
    expected4 = "123  456   \r\n789"
    expected5 = txt
    assert_equal expected1, TextFlowed.encode(txt, 8)
    assert_equal expected2, TextFlowed.encode(txt, 9)
    assert_equal expected3, TextFlowed.encode(txt, 10)
    assert_equal expected4, TextFlowed.encode(txt, 11)
    assert_equal expected4, TextFlowed.encode(txt, 12)
    assert_equal expected4, TextFlowed.encode(txt, 13)
    assert_equal expected5, TextFlowed.encode(txt, 14)
    assert_equal expected5, TextFlowed.encode(txt, 15)
  end

  def test_paragraphs_with_variable_lengths
    txt       = "123 456 789\n\none two three\n\nEND"
    expected1 = "123 \r\n456 \r\n789\r\n\r\none \r\ntwo \r\nthree\r\n\r\nEND"
    expected2 = "123 456 \r\n789\r\n\r\none two \r\nthree\r\n\r\nEND"
    expected3 = "123 456 789\r\n\r\none two \r\nthree\r\n\r\nEND"
    expected4 = "123 456 789\r\n\r\none two three\r\n\r\nEND"
    assert_equal expected1, TextFlowed.encode(txt, 4)
    assert_equal expected2, TextFlowed.encode(txt, 10)
    assert_equal expected3, TextFlowed.encode(txt, 11)
    assert_equal expected3, TextFlowed.encode(txt, 12)
    assert_equal expected4, TextFlowed.encode(txt, 13)
    assert_equal expected4, TextFlowed.encode(txt, 14)
    assert_equal expected4, TextFlowed.encode(txt, txt.length)
    assert_equal expected4, TextFlowed.encode(txt, txt.length+1)
  end

  def test_trailing_newlines_removed
    txt = "123 456 789\r\nabc def ghi"
    assert_equal txt, TextFlowed.encode(txt+"\n", 11)
    assert_equal txt, TextFlowed.encode(txt+"\r\n", 11)
  end

  def test_tab_expansion
    txt      = "123\t456"
    expected1 = "123\r\n456"
    expected2 = "123 \r\n456"
    expected3 = "123  \r\n456"
    expected4 = "123   \r\n456"
    expected5 = "123    \r\n456"
    expected6 = "123    456"
    assert_equal expected1, TextFlowed.encode(txt, 2)
    assert_equal expected1, TextFlowed.encode(txt, 3)
    assert_equal expected2, TextFlowed.encode(txt, 4)
    assert_equal expected3, TextFlowed.encode(txt, 5)
    assert_equal expected4, TextFlowed.encode(txt, 6)
    assert_equal expected5, TextFlowed.encode(txt, 7)
    assert_equal expected5, TextFlowed.encode(txt, 8)
    assert_equal expected5, TextFlowed.encode(txt, 9)
    assert_equal expected6, TextFlowed.encode(txt, 10)
  end

  def test_spacing_after_hard_line_break
    txt = "123\r\n\r\n  abc"
    exp = "123\r\n\r\nabc"
    assert_equal exp, TextFlowed.encode(txt, 4) # remove SP if line > max
    assert_equal txt, TextFlowed.encode(txt, 5) # preserve SP if line == max
    assert_equal txt, TextFlowed.encode(txt, 6) # preserve SP if line < max
  end

  def test_trim_spaces_before_hard_line_breaks
    txt1     = "123 \r\n\r\n456"
    txt2     = "123 \r\n\r\n456 "
    expected = "123\r\n\r\n456"
    assert_equal expected, TextFlowed.encode(txt1, 3)
    assert_equal expected, TextFlowed.encode(txt1, 4)
    assert_equal expected, TextFlowed.encode(txt1, 5)
    assert_equal expected, TextFlowed.encode(txt2, 3)
    assert_equal expected, TextFlowed.encode(txt2, 4)
    assert_equal expected, TextFlowed.encode(txt2, 5)
  end

  def test_trim_trailing_spaces
    txt      = "123 456 "
    expected = "123 \r\n456"
    assert_equal expected, TextFlowed.encode(txt, 4)
  end

  def test_rfc_79_character_max_flowed_line_length
    assert_equal (max = 79), TextFlowed::MAX_FLOWED_LINE
    TextFlowed.encode('', max) # no error
    assert_raises(ArgumentError) { TextFlowed.encode('', max+1) }
  end

  def test_rfc_max_smtp_line_length_boundary
    long_word = 'x' * MIME::MAX_LINE_LENGTH
    txt1      = long_word
    txt2      = 'x'  + long_word
    txt3      = 'x ' + long_word
    txt4      = 'x ' + long_word + ' x'
    expected1 = long_word
    expected2 = long_word + "\r\nx"
    expected3 = "x \r\n" + long_word
    expected4 = "x \r\n" + long_word + "\r\nx"
    assert_equal expected1, TextFlowed.encode(txt1)
    assert_equal expected2, TextFlowed.encode(txt2)
    assert_equal expected3, TextFlowed.encode(txt3)
    assert_equal expected4, TextFlowed.encode(txt4)
  end

end
