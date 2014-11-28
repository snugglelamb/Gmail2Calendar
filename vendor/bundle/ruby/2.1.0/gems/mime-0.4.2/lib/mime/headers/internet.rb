module MIME
  module Headers

    #
    # The RFC 2822 Internet message header fields.
    #
    # Mailbox fields #to, #from, #cc, #bcc, and #reply_to may be a single email
    # address, an array of email addresses, or a hash of _email_ => _name_
    # pairs. When using a hash, set _name_ to +nil+ to omit email display name.
    # The #sender field is a special case and can only contain a single mailbox.
    #
    module Internet

      # Internet message character specifications (RFC 5322)
      ATOM     = /[[:alnum:]!#\$%&'*+\/=?^_`{|}~-]/
      DOT_ATOM = /^#{ATOM}+(#{ATOM}|\.)*$/
      SPECIALS = /[()<>\[\]:;@\,."]/

      attr_reader(
        # Required Headers
        :to,
        :from,
        :date, 

        # Optional Headers
        :cc,
        :bcc,
        :sender,
        :reply_to,
        :message_id,
        :in_reply_to,
        :references,
        :comments,
        :keywords,
        :subject
      )

      #
      # Origination date at which the creator of the message indicated that the
      # message was complete and ready to enter the mail delivery system.
      #
      def date= date
        @date = date
        headers.set('Date', date.rfc2822)
      end

      #
      # Person(s) or system(s) responsible for writing the message.
      #
      def from= mailbox
        @from = mailbox
        headers.set('From', stringify_mailbox(mailbox))
      end

      #
      # Mailbox of the agent responsible for actual transmission of the message.
      # Sender field is required if the From field contains multiple mailboxes.
      #
      # === Example scenario
      # If a secretary were to send a message for another person, the mailbox of
      # the secretary would appear in the Sender field and the mailbox of the
      # actual author would appear in the From field. 
      #
      def sender= mailbox
        if (mailbox.is_a?(Hash) || mailbox.is_a?(Array)) && mailbox.size != 1
          raise ArgumentError, '"Sender" must be a single mailbox specification'
        end
        @sender = mailbox
        headers.set('Sender', stringify_mailbox(mailbox))
      end

      #
      # Mailbox(es) of the primary recipient(s).
      #
      def to= mailbox
        @to = mailbox
        headers.set('To', stringify_mailbox(mailbox))
      end

      #
      # Mailbox(es) of others who are to receive the message, though the content
      # of the message may not be directed at them; "Carbon Copy."
      #
      def cc= mailbox
        @cc = mailbox
        headers.set('Cc', stringify_mailbox(mailbox))
      end

      #
      # Mailbox(es) of recipients of the message whose addresses are not to be
      # revealed to other recipients of the message; "Blind Carbon Copy."
      #
      def bcc= mailbox
        @bcc = mailbox
        headers.set('Bcc', stringify_mailbox(mailbox))
      end

      #
      # Mailbox(es) to which the author suggests that replies be sent.
      #
      def reply_to= mailbox
        @reply_to = mailbox
        headers.set('Reply-To', stringify_mailbox(mailbox))
      end

      #
      # Globally unique identifier of the message.
      #
      # The message +id+ must contain an embedded "@" symbol. An example +id+
      # might be <em>some-unique-id@domain.com</em>.
      #
      def message_id= id
        @message_id = id
        headers.set('Message-ID', "<#{id}>")
      end

      #
      # The +id+ of the message to which this message is a reply.
      #--
      # TODO fully implement and test
      #
      def in_reply_to= id
        @in_reply_to = id
        headers.set('In-Reply-To', "<#{id}>")
      end

      #
      # The +id+ used to identify a "thread" of conversation.
      #--
      # TODO fully implement and test
      #
      def references= id
        @references = id
        headers.set('References', "<#{id}>")
      end

      #
      # Additional comments about the message content.
      #
      def comments= comments
        @comments = comments
        headers.set('Comments', comments)
      end

      #
      # Comma-separated list of important words and phrases that might be useful
      # for the recipient.
      #
      def keywords= keywords
        @keywords = keywords
        headers.set('Keywords', keywords)
      end

      #
      # The message topic.
      #
      def subject= subject
        @subject = subject
        headers.set('Subject', subject)
      end


      private

      def stringify_mailbox mailbox
        case mailbox
        when Hash
          mailbox.map do |email, name|
            if name
              if name =~ SPECIALS
                name.gsub!('"', '\"')
                %["#{name}" <#{email}>]
              else
                %[#{name} <#{email}>]
              end
            else
              email
            end
          end.join(', ')
        when Array
          mailbox.join(', ')
        else
          return mailbox
        end
      end

    end
  end
end
