#require 'simplecov'
#SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/enigma.rb'

class EnigmaTest < Minitest::Test

  def test_class_exists
    e = Enigma.new

    assert Enigma
  end

  def test_rotation_assignment
    e = Enigma.new
    key = "12345"
    a_rotation = (key[0] + key[1]).to_i

    assert_equal 12, a_rotation
  end

end
