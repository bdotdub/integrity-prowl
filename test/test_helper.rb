require 'rubygems'
require 'test/unit'
require 'flexmock/test_unit'
require 'shoulda'
require 'randexp'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
$LOAD_PATH.unshift(File.dirname(__FILE__))

class Randexp::Dictionary
  def self.load_dictionary
    File.read(File.dirname(__FILE__) + '/dict').split
  end
end

class Test::Unit::TestCase
end
