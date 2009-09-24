require 'test_helper'
require 'integrity/notifier/test'
require 'integrity/notifier/prowl'

class IntegrityProwlTest < Test::Unit::TestCase
  include Integrity::Notifier::Test

  context "A prowl notifier" do
    setup { setup_database }

    should "register itself" do
      assert_equal Integrity::Notifier::Prowl, Integrity::Notifier.available["Prowl"]
    end
  end
end
