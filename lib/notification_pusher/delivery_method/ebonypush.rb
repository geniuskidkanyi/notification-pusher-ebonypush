# frozen_string_literal: true

module NotificationPusher
  module DeliveryMethod
    class EnonyPush < NotificationPusher::DeliveryMethod::Base
      def call
        return unless options[:player_ids].any?
        push = Webpush.payload_send(
            message: options[:message],
            endpoint:options[:endpoint],
            p256dh: options[:keys][:p256dh],
            auth: options[:keys][:auth],
            vapid: {
            subject: options[:subject],
            public_key: options[:vapid_public_key],
            private_key: options[:vapid_private_key]
            },
            ssl_timeout: 5, # value for Net::HTTP#ssl_timeout=, optional
            open_timeout: 5, # value for Net::HTTP#open_timeout=, optional
            read_timeout: 5 # value for Net::HTTP#read_timeout=, optional
        )
       
      end

      private

    
    end
  end
end
