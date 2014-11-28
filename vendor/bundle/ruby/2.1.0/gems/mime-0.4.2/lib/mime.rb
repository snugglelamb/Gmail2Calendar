#
# = Construct Multipurpose Internet Mail Extensions (MIME) messages.
#
# ---
#
# RFCs referenced during the implementation of this library:
#
# * RFC-2822 Internet Message Format (obsoletes 822)
# * RFC-2045 MIME Part 1: Format of Internet Message Bodies
# * RFC-2046 MIME Part 2: Media Types
# * RFC-2047 MIME Part 3: Message Header Extensions for Non-ASCII Text
# * RFC-2048 MIME Part 4: Registration Procedures
# * RFC-2049 MIME Part 5: Conformance Criteria and Examples
#
# ---
#
# See SOAP::MIMEMessage for other implementation ideas.
#
module MIME

  VERSION = '0.4.2'

  # Defined in RFC: https://tools.ietf.org/html/rfc5322#section-2.1.1
  MAX_LINE_LENGTH = 998

  module ID
    #
    # Generate local ID.
    #
    def self.generate_id
      timestamp = (Time.now.to_f * 1E7).to_i
      rand(1E9).to_s(36) +
      object_id.to_s(36) +
      timestamp.to_s(36)
    end

    #
    # Generate global ID for "Message-ID" or "Content-ID" header.
    #
    def self.generate_gid domain = nil
      generate_id + "@" + (domain || "#{generate_id}.local")
    end
  end

end

require 'mime/content_types'
require 'mime/content_formats/text_flowed'
require 'mime/error'
require 'mime/header'
require 'mime/media'
require 'mime/composite_media'
require 'mime/discrete_media'
require 'mime/discrete_media_factory'
require 'mime/mail'
