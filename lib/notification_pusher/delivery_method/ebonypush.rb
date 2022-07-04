# frozen_string_literal: true

module NotificationPusher
  module DeliveryMethod
    class EnonyPush < NotificationPusher::DeliveryMethod::Base
      def call
        # return unless options.any?
        # binding.pry
        message = {
          title:  options[:subject],
          body: options[:message],
          url: options[:url],
          tag: options[:tag]
        }
        push = Webpush.payload_send(
            message: JSON.generate(message),
            title: options[:subject],
            endpoint:options[:endpoint],
            p256dh: options[:p256dh],
            auth: options[:auth],
            vapid: {
            subject: options[:subject],
            public_key: options[:vapid_public_key],
            private_key: options[:vapid_private_key]
            },
            ssl_timeout: 5, # value for Net::HTTP#ssl_timeout=, optional
            open_timeout: 5, # value for Net::HTTP#open_timeout=, optional
            read_timeout: 5 # value for Net::HTTP#read_timeout=, optional
        )

        if options[:phone_number].present? && options[:username].present? && options[:account_sid].present? && options[:auth_token].present?
          client = Twilio::REST::Client.new(options[:account_sid], options[:auth_token])
          client.messages.create(
            from: options[:phone_number],
            to: options[:username],
            body: options[:title] + options[:message] + " click on the link to start a chat " + options[:url]
          )
        end
       
      end

      private

    
    end
  end
end
