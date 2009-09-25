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
    end
  end
end
