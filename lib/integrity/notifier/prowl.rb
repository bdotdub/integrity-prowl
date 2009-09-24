require 'integrity'

module Integrity
  class Notifier
    class Prowl < Notifier::Base
      def self.to_haml
      end

      def deliver!
      end

      def to_s
        'Prowl'
      end
    end

    register Prowl # Don't forget to register your notifier!
  end
end

