module MIME
  module Headers

    #
    # The RFC 2045 MIME message header fields.
    #
    module MIME

      attr_reader(
        :mime_version,
        :description,
        :disposition,
        :id,
        :transfer_encoding,
        :type
      )

      #
      # Describes the content, which can be useful for non-MIME clients.
      #
      def description= description
        @description = description
        headers.set('Content-Description', description)
      end

      #
      # Specifies the disposition of the content relative to its enclosing
      # message. Valid values for +disposition+ are _inline_ and _attachment_.
      # Parameters can also be specified here; see the RFC for details.
      #
      # RFC 2183 Communicating Presentation Information in Internet Messages.
      #
      def disposition= disposition
        @disposition = disposition
        headers.set('Content-Disposition', disposition)
      end

      #
      # Globally unique ID that identifies a top-level message or message
      # entity. Content IDs can be used for referencing or caching purposes.
      #
      def id= id
        @id = id
        headers.set('Content-ID', "<#{id}>")
      end

      #
      # The mechanism used for encoding the top-level message content.
      #
      # Common Encoding Mechanisms
      # * 7bit
      # * 8bit
      # * binary
      # * quoted-printable
      # * base64
      #
      def transfer_encoding= encoding
        @transfer_encoding = encoding
        headers.set('Content-Transfer-Encoding', encoding)
      end

      #
      # Currently only version 1.0 exists.
      #
      def mime_version= version
        @mime_version = version
        headers.set('MIME-Version', version)
      end

      protected

      #
      # Specifies the media type and subtype of the content. +type+ will have
      # the form <em>media-type/subtype</em>.
      #
      # Common Content Types
      # * application/octet-stream
      # * audio/mpeg
      # * image/jpeg
      # * text/plain
      # * video/mpeg
      #
      def type= type
        @type = type
        headers.set('Content-Type', type)
      end

      #
      # +type+ is the disposition type of either "inline" or "attachment".
      # +params+ is a Hash with zero or more of the following keys:
      #
      # +filename+          :: name of file
      # +creation-date+     :: RFC2822 date-time
      # +modification-date+ :: RFC2822 date-time 
      # +read-date+         :: RFC2822 date-time
      # +size+              :: file size in octets
      #
      # The values for the *-date keys may use Time::rfc2822.
      #
      def set_disposition type, params = {}
        if params['filename']
          params['filename'] = File.basename(params['filename'])
        elsif self.respond_to?(:path)
          params['filename'] = File.basename(self.path)
        end
        self.disposition = append_field_params(type, params)
      end


      private

      #
      # Append parameters to header field body.
      # Used for Content-Type and Content-Disposition headers.
      #
      def append_field_params body, params = {}
        params.each do |name, value|
          next unless value
          unless value =~ Internet::DOT_ATOM
            value = '"' + value.gsub('"','\"') + '"'
          end
          body << "; #{name}=#{value}"
        end
        body
      end

    end
  end
end
