require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/key_generator.rb'

class EnigmaTest < Minitest::Test

  def test_class_exists
    e = Enigma.new

    assert e
  end



end
