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
        config = { 'api_keys' => 'an_api_key', 'failed' => '1' }
        flexmock(::Prowl).should_receive(:add).once

        notifier = Integrity::Notifier::Prowl
        notifier.notify_of_build(Integrity::Build.gen(:failed), config)
      end

      should 'add n prowl message with n keys' do
        [5, 10, 25, 50].each do |to|
          keys = (0...to).map{ |n| "api_key_#{n}" }
          config = { 'api_keys' => keys.join(','), 'failed' => '1' }
          flexmock(::Prowl).should_receive(:add).times(keys.length)

          notifier = Integrity::Notifier::Prowl
          notifier.notify_of_build(Integrity::Build.gen(:failed), config)
        end
      end
    end

    should 'not notify prowl if no key is provided' do
      [nil, ''].each do |key|
        config = { 'api_keys' => key, 'failed' => 1 }
        flexmock(::Prowl).should_receive(:add).times(0)

        notifier = Integrity::Notifier::Prowl
        notifier.notify_of_build(Integrity::Build.gen(:failed), config)
      end
    end

    context 'state' do
      should 'not notify if no states are checked' do
        config = { 'api_keys' => 'an_api_key' }
        flexmock(::Prowl).should_receive(:add).times(0)

        notifier = Integrity::Notifier::Prowl
        notifier.notify_of_build(Integrity::Build.gen(:successful), config)
      end

      should 'not notify if the state is not checked' do
        config = { 'api_keys' => 'an_api_key', 'failed' => '1' }
        flexmock(::Prowl).should_receive(:add).times(0)

        notifier = Integrity::Notifier::Prowl
        notifier.notify_of_build(Integrity::Build.gen(:successful), config)
      end

      should 'send notification when correct status is set' do
        config = { 'api_keys' => 'an_api_key', 'failed' => '1', 'successful' => '1' }
        flexmock(::Prowl).should_receive(:add).times(1)

        [:successful, :failed].each do |status|
          notifier = Integrity::Notifier::Prowl
          notifier.notify_of_build(Integrity::Build.gen(status), config)
        end
      end
    end
  end
end
