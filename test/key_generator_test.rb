require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/key_generator.rb'

class KeyGeneratorTest < Minitest::Test
  def test_class_exists
    key_gen = KeyGenerator.new

    refute key_gen.nil?
  end

end
