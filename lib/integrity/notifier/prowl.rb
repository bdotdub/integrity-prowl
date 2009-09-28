require 'integrity'
require 'prowl'

module Integrity
  class Notifier
    class Prowl < Notifier::Base
      attr_reader :config

      def self.to_haml
        File.read(File.dirname(__FILE__) + '/config.haml')
      end

      def deliver!
        return unless config[commit.status.to_s] == '1'

        if api_keys = config['api_keys']
          api_keys.split(',').each do |key|
            prowl_params = {}
            prowl_params[:application]  = commit.project.name
            prowl_params[:event]        = short_message
            prowl_params[:description]  = full_message

            ::Prowl.add(key, prowl_params)
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

