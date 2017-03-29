require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require 'pry-state'
require './lib/decrypt'

class DecryptTest < Minitest::Test

  def test_instance_of_class
    d = Decrypt.new

    assert_instance_of Decrypt, d
  end

  def test_

end