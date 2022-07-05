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
          # binding.pry
        if options[:phone_number].present? && options[:username].present? && options[:sms_to_api_key].present? && options[:is_african] == true
          username = options[:username]
          phone_number = options[:phone_number]
          caller_username = options[:caller_username]
          require "uri"
          require "json"
          require "net/http"

          url = URI("https://api.sms.to/sms/send")

          https = Net::HTTP.new(url.host, url.port)
          https.use_ssl = true

          request = Net::HTTP::Post.new(url)
          request["Authorization"] = "Bearer #{options[:sms_to_api_key]}"
          request["Content-Type"] = "application/json"
          request.body = JSON.dump({
            "message": "Hi #{username},\nyou have an Ebony Chat Request from #{caller_username}. click on the link to start your chat. #{options[:url]}",
            "to": "#{phone_number}",
            "bypass_optout": true,
            "sender_id": "EbonyChat",
            "callback_url": "https://example.com/callback/handler"
          })

          response = https.request(request)
          puts response.read_body
          
        end
       
      end

      private

    
    end
  end
end
