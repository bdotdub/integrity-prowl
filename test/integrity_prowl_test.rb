require 'test_helper'
require 'integrity/notifier/test'
require 'integrity/notifier/prowl'

class IntegrityProwlTest < Test::Unit::TestCase
  include Integrity::Notifier::Test

  context 'A prowl notifier' do
    setup do
      setup_database
    end

    should 'register itself' do
      assert_equal  Integrity::Notifier::Prowl,
                    Integrity::Notifier.available['Prowl']
    end

    context 'with valid API keys' do
      should 'add one prowl message with one key' do
        config = { :api_keys => 'an_api_key' }
        flexmock(::Prowl).should_receive(:add).once

        notifier = Integrity::Notifier::Prowl
        notifier.notify_of_build(Integrity::Build.gen(:successful), config)
      end

      should 'add n prowl message with n keys' do
        keys = (0...rand(100)).map{ |n| "api_key_#{n}" }
        config = { :api_keys => keys.join(',') }
        flexmock(::Prowl).should_receive(:add).times(keys.length)

        notifier = Integrity::Notifier::Prowl
        notifier.notify_of_build(Integrity::Build.gen(:successful), config)
      end
    end

    should 'not notify prowl if no key is provided' do
      [nil, ''].each do |key|
        config = { :api_keys => key }
        flexmock(::Prowl).should_receive(:add).times(0)

        notifier = Integrity::Notifier::Prowl
        notifier.notify_of_build(Integrity::Build.gen(:successful), config)
      end
    end
  end
end
