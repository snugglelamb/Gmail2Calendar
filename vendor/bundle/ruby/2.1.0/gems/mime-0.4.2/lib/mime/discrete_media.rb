module MIME

  #
  # Discrete media must be handled by non-MIME mechanisms; they are opaque to
  # MIME processors. Therefore, the body of a DiscreteMedia object does not need
  # further MIME processing.
  #
  # This class is abstract.
  #
  class DiscreteMedia < Media
    def initialize(content, content_type, content_params)
      AbstractClassError.no_instantiation(self, DiscreteMedia)
      super
    end
  end

  #
  # Application is intended for discrete data that is to be processed by some
  # type of application program. The body contains information which must be
  # processed by an application before it is viewable or usable by a user.
  #
  # Application is the catch all class. If your content cannot be identified as
  # another DiscreteMedia, then it is application media.
  #
  class Application < DiscreteMedia
    def initialize(body, subtype = 'octet-stream', params = {})
      super(body, "application/#{subtype}", params)
    end
  end

  #
  # Audio is intended for discrete audio content. The +subtype+ indicates the
  # specific audio format, such as *mpeg* or *midi*.
  #
  class Audio < DiscreteMedia
    def initialize(body, subtype = 'basic', params = {})
      super(body, "audio/#{subtype}", params)
    end
  end

  #
  # Image is intented for discrete image content. The +subtype+ indicates the
  # specific image format, such as *jpeg* or *gif*.
  #
  class Image < DiscreteMedia
    def initialize(body, subtype = 'jpeg', params = {})
      super(body, "image/#{subtype}", params)
    end
  end

  #
  # Text is intended for content which is principally textual in form. The
  # +subtype+ indicates the specific text type, such as *plain* or *html*.
  #
  class Text < DiscreteMedia
    def initialize(body, subtype = 'plain', params = {})
      super(body, "text/#{subtype}", params)
    end
  end

  #
  # Video is intended for discrete video content. The content +subtype+
  # indicates the specific video format. The RFC describes video media as
  # content that contains a time-varying-picture image, possibly with color and
  # coordinated sound.
  #
  class Video < DiscreteMedia
    def initialize(body, subtype = 'mpeg', params = {})
      super(body, "video/#{subtype}", params)
    end
  end

end
