module MIME

  #
  # Module used only for initializing derived DiscreteMedia objects.
  #
  module DiscreteMediaFactory

    module DispositionParameters
      attr_accessor :path, :size
    end

    class << self

      include ContentTypes

      #
      # Creates a corresponding DiscreteMedia subclass object for the given
      # +file+ based on +file+'s filename extension. +file+ can be a file path
      # or File object.
      #
      # +content_type+ can be specified in order to override the auto detected
      # content type. If the +content_type+ cannot be detected, an
      # UnknownContentError exception will be raised.
      #
      # Creates and sets the singleton method +path+ on the created object. The
      # +path+ method is utilized by other methods in the MIME library,
      # therefore, eliminating redundant and explicit filename assignments.
      #
      # === Comparison Example
      #
      #  file1 = '/tmp/file1.txt'
      #  file2 = '/tmp/file2.txt'
      #  entity1 = Text.new(File.read(file1))
      #  entity2 = DiscreteMediaFactory.create(file2)
      #
      #  mixed_msg = Multipart::Mixed.new
      #  mixed_msg.attach(entity1, 'filename' => file1)
      #  mixed_msg.attach(entity2) # filename automatically added
      #
      def create file, content_type = nil
        if file.is_a? File
          cntnt = file.read
          ctype = content_type || file_type(file.path)
          fname = file.path
        else
          cntnt = IO.read(file)
          ctype = content_type || file_type(file)
          fname = file
        end

        type, subtype = ctype.to_s.split('/')
        if type.to_s.empty? || subtype.to_s.empty?
          raise UnknownContentError, "invalid content type: #{ctype}"
        end

        media_obj = 
          case type
          when 'application'; Application.new(cntnt, subtype)
          when 'audio'      ; Audio.new(cntnt, subtype)
          when 'image'      ; Image.new(cntnt, subtype)
          when 'text'       ; Text.new(cntnt, subtype)
          when 'video'      ; Video.new(cntnt, subtype)
          else raise UnknownContentError, "invalid content type: #{ctype}"
          end

        media_obj.extend(DispositionParameters)
        media_obj.path = fname
        media_obj
      end
    end
  end
end
