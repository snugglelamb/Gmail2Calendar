module MIME

  #
  # Composite media types allow encapsulating, mixing, and hierarchical
  # structuring of entities of different types within a single message.
  # Therefore, a CompositeMedia body is composed of one or more CompositeMedia
  # and/or DiscreteMedia objects.
  #
  # CompositeMedia implements Content-Disposition for dictating presentation
  # style of body entities via #add, #attach, and #inline. For more information
  # on disposition parameters, such as filename, size, and modification-date,
  # see https://tools.ietf.org/html/rfc2183.
  #
  # This class is abstract.
  #
  class CompositeMedia < Media

    class Body
      #
      # Create new composite body.
      #
      def initialize boundary
        @boundary = boundary
        @body = Array.new
      end

      #
      # Format the CompositeMedia object as a MIME message.
      #
      def to_s
        all_entities = @body.join("\r\n--#{@boundary}\r\n")
        "--#{@boundary}\r\n#{all_entities}\r\n--#{@boundary}--\r\n"
      end

      #
      # Add +entity+ to the composite body.
      #
      def add entity
        @body.push(entity)
      end
    end


    attr_reader :boundary

    def initialize content_type
      AbstractClassError.no_instantiation(self, CompositeMedia)
      @boundary = "Boundary_#{ID.generate_id}"  # delimits body entities
      super(Body.new(boundary), content_type, 'boundary' => boundary)
    end

    #
    # Add a Media +entity+ to the message.
    #
    # The entity will be added to the main body of the message with no
    # disposition specified. Presentation of the entity will be dictated by
    # the display user agent.
    #
    # === Text and HTML Multipart/Alternative message
    #
    # A display user agent may only be capable of displaying plain text. If so,
    # it will choose to display the Text/Plain entity. However, if it is capable
    # of displaying HTML, it may choose to display the Text/HTML version.
    #
    #   msg = MIME::Multipart::Alternative.new
    #   msg.add(MIME::Text.new('plain text'))
    #   msg.add(MIME::Text.new('<html>html text</html>', 'html'))
    #
    # The order in which the entities are added is significant. Add the simplest
    # representations first.
    #
    def add entity
      raise Error.new('can only add Media objects') unless entity.is_a? Media
      @body.add(entity)
    end

    #
    # Attach a Media +entity+ to the message.
    #
    # The entity will be presented as separate from the main body of the
    # message. Thus, display of the entity will not be automatic, but contingent
    # upon some further action of the user. For example, the display user agent
    # may present an icon representation of the entity, which the user can
    # select to view or save the entity.
    #
    # === Attachment with filename and size parameters:
    #
    #   f = File.open('file.txt')
    #   file = MIME::Text.new(f.read)
    #   text = MIME::Text.new('See the attached file.')
    #
    #   msg = MIME::Multipart::Mixed.new
    #   msg.inline(text)
    #   msg.attach(file, 'filename' => f.path, 'size' => f.size)
    #
    def attach entity, params = {}
      entity.set_disposition('attachment', params)
      add(entity)
    end

    #
    # Inline a Media +entity+ in the message.
    #
    # The entity will be embedded within the main body of the message. Thus,
    # display of the entity will be automatic upon display of the message.
    # Inline entities should be added in the order in which they occur within
    # the message.
    #
    # === Message with two embedded images:
    #
    #  msg = MIME::Multipart::Mixed.new
    #  msg.inline(MIME::Image.new(File.read('screenshot1.png'), 'png'))
    #  msg.inline(MIME::Image.new(File.read('screenshot2.png'), 'png'))
    #  msg.description = 'My screenshots'
    #
    def inline entity, params = {}
      entity.set_disposition('inline', params)
      add(entity)
    end

  end

  #
  # Message is intended to encapsulate another message. In particular, the
  # <em>message/rfc822</em> content type is used to encapsulate RFC 822
  # messages.
  #
  # TODO Implement
  #
  class Message < CompositeMedia
  end

  #
  # The abstract base class for all multipart message subtypes. The entities of
  # a multipart message are delimited by a unique boundary.
  #
  class Multipart < CompositeMedia
    def initialize media_subtype
      AbstractClassError.no_instantiation(self, Multipart)
      super("multipart/#{media_subtype}")
    end
  end

  #
  # The Alternative subtype indicates that each contained entity is an
  # alternatively formatted version of the same content. The most complex
  # version should be added to the message first, i.e. it will be sequentially
  # last in the message.
  #
  class Multipart::Alternative < Multipart

    #
    # Returns a Multipart::Alternative object with a content type of
    # multipart/alternative.
    #
    def initialize
      super('alternative')
    end

  end

  #
  # The FormData subtype expresses values for HTML form data submissions.
  # ---
  # RFCs consulted during implementation:
  #
  # * RFC-1867  Form-based File Upload in HTML
  # * RFC-2388  Returning Values from Forms: multipart/form-data
  #
  class Multipart::FormData < Multipart

    #
    # Returns a Multipart::FormData object with a content type of
    # multipart/form-data.
    #
    def initialize
      super('form-data')
    end

    #
    # Add the Media object, +entity+, to the FormData object. +name+ is
    # typically an HTML input tag variable name. If the input tag is of type
    # _file_, then +filename+ must be specified to indicate a file upload.
    #
    def add entity, name, filename = nil
      entity.set_disposition('form-data', 'name' => name, 'filename' => filename)
      super(entity)
    end

  end

  #
  # The Mixed subtype aggregates contextually independent entities.
  #
  class Multipart::Mixed < Multipart

    #
    # Returns a Multipart::Mixed object with a content type of
    # multipart/mixed.
    #
    def initialize
      super('mixed')
    end

  end

  #
  # The Related subtype aggregates multiple related entities. The message
  # consists of a root (the first entity) which references subsequent inline
  # entities. Message entities should be referenced by their Content-ID header.
  # The syntax of a reference is unspecified and is instead dictated by the
  # encoding or protocol used in the entity.
  # ---
  # RFC consulted during implementation:
  # 
  # * RFC-2387  The MIME Multipart/Related Content-type
  #
  class Multipart::Related < Multipart

    #
    # Returns a Multipart::Related object with a content type of
    # multipart/related.
    #
    def initialize
      super('related')
    end

  end

end
