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
        if options[:phone_number].present? && options[:username].present? && options[:account_sid].present? && options[:auth_token].present? && options[:is_african] == true
          username = options[:username]
          phone_number = options[:phone_number]
          caller_username = options[:caller_username]
          message = "Hi there,\n you have a EbonyChat Request from #{caller_username}. click link to accept. #{options[:url]}"
         
          require 'rubygems' 
          require 'twilio-ruby' 
          
          account_sid = options[:account_sid]
          auth_token = options[:auth_token]
          sender_id = options[:sender_id]
          @client = Twilio::REST::Client.new(account_sid, auth_token) 
          
          message = @client.messages.create( 
                                      body: message,  
                                      messaging_service_sid: 'MGef1a83a079b4290af8d13a8e4b582f99',      
                                      to: phone_number,
                                      from: sender_id
                                    ) 
          
          
        end
       
      end

      private

    
    end
  end
end
