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



end
