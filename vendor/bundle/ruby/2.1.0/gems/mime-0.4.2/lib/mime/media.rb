require 'mime/headers/mime'

module MIME

  #
  # Abstract top-level media class.
  #
  class Media

    include Headers::MIME

    attr_reader :headers, :body

    def initialize content, content_type, content_params = {}
      AbstractClassError.no_instantiation(self, Media)
      @headers  = Header.new
      @body     = content
      self.id   = ID.generate_gid
      self.type = append_field_params(content_type, content_params)
    end

    #
    # Format the Media object as a MIME message.
    #
    def to_s
      "#{headers}\r\n\r\n#{body}"
    end

  end
end
