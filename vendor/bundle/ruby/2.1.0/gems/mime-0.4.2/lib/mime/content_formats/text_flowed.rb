#
# == Content Formats
#
# [Text/Plain Flowed] TextFlowed
# [Quoted-Printable]  To be implemented ...
# [Base64]            To be implemented ...
#
module MIME::ContentFormats

  #
  # Minimal implementation of RFC 2646: The Text/Plain Format Parameter
  #
  # https://tools.ietf.org/html/rfc2646
  #
  # == Excerpts from RFC
  #
  # This memo proposes a new parameter to be used with Text/Plain, and, in the
  # presence of this parameter, the use of trailing whitespace to indicate
  # flowed lines.  This results in an encoding which appears as normal
  # Text/Plain in older implementations, since it is in fact normal
  # Text/Plain.
  #
  # Each paragraph is displayed, starting at the left margin (or paragraph
  # indent), and continuing to the right until a word is encountered which
  # does not fit in the remaining display width. This word is displayed at the
  # left margin of the next line. This continues until the paragraph ends (a
  # CRLF is seen).
  #
  # == MIME format parameter to the text/plain media type
  #
  #   Name:  Format
  #   Value: Fixed, Flowed
  #   Example: Content-Type: text/plain; charset=iso-8859-1; format=flowed
  #
  #--
  # == TODO
  # - Implement RFC 3676, which obsoletes RFC 2646.
  # - Usenet signature convention (section 4.3)
  # - Space-Stuffing (section 4.4)
  # - Quoting (section 4.5)
  # - Perhaps this should be subsumed into the MIME project.
  #
  module TextFlowed

    MAX_FLOWED_LINE = 79

    #
    # Encode plain +text+ into flowed format, reducing long lines to +max+
    # characters or less using soft line breaks (i.e., SPACE+CRLF).
    #
    # According to the RFC, the +max+ flowed line length is 79 characters. Line
    # lengths of 66 and 72 characters are common.
    #
    # The features of RFC 2646, such as line quoting and space-stuffing,
    # are not implemented.
    #
    def self.encode(text, max = MAX_FLOWED_LINE)
      if max > MAX_FLOWED_LINE
        raise ArgumentError, "flowed lines must be #{MAX_FLOWED_LINE} characters or less"
      end

      out = []
      text.split(/\r\n|\n/).each do |paragraph|
        # tab use is discouraged
        # http://tools.ietf.org/html/rfc822#section-3.4.2 
        paragraph.gsub!(/\t/, ' '*4)

        # trim spaces before hard break
        # http://tools.ietf.org/html/rfc2646#section-4.1
        paragraph.rstrip!

        if paragraph.length <= max
          out << paragraph
        else # flow text
          line = ''
          word = ''

          paragraph.each_char do |char|
            if char == ' '
              # Omit spaces after soft break to prevent stuffing on next line.
              next if word.empty? && (line.size == 0 || line.size == max)

              if (line.size + word.size) < max
                line << word + char
              else # soft break situation
                unless line.empty?
                  out << line.dup
                  line.clear
                end
                if word.size < max
                  line << word + char
                else
                  word.scan(/.{1,#{MIME::MAX_LINE_LENGTH}}/) {|s| out << s }
                end
              end
              word.clear
            else  # accumulate non-space characters in buffer
              word += char
            end
          end

          # flush buffers in an orderly fashion
          if ! word.empty?
            if (line.size + word.size) <= max
              out << line + word
            else
              out << line unless line.empty?
              word.scan(/.{1,#{MIME::MAX_LINE_LENGTH}}/) {|s| out << s }
            end
          elsif ! line.empty?
            out << line
          end
        end
      end

      out.join("\r\n")
    end

    #
    # Decode flowed plain +text+.
    #
    def self.decode(text)
      raise NotImplementedError
    end
  end
end
