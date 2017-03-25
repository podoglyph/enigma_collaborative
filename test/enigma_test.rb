require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/enigma.rb'

class EnigmaTest < Minitest::Test

  def test_class_exists
    e = Enigma.new

    assert Enigma
  end

  def test_key_generation_outputs_unique_values
    e = Enigma.new
    key_1 = e.key_generator
    key_2 = e.key_generator

    refute_equal key_1, key_2
  end

  def test_key_is_five_digits
    e = Enigma.new
    key = e.key_generator
    key_length = key.to_s.length

    assert_equal 5, key_length
  end



end
