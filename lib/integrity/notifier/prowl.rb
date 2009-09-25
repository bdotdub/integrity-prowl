require 'integrity'

module Integrity
  class Notifier
    class Prowl < Notifier::Base
      def self.to_haml
        File.read(File.dirname(__FILE__) + '/config.haml')
      end

      def deliver!
        if api_keys = config['api_keys']
          api_keys.split(',').each do |key|
            Prowl.add(key, { :application  => "Integrity",
                             :event        => short_message,
                             :description  => long_message
            })
          end
        end
      end

      def to_s
        'Prowl'
      end
    end

    register Prowl
  end
end

