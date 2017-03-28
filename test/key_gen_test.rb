#require 'simplecov'
#SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/key_gen.rb'

class KeyGenTest < Minitest::Test

  def test_random_string_created_on_initialize
    k = KeyGen.new

    assert k.key.kind_of?(String)
  end

  def test_key_gen_creates_five_digit_number
    k = KeyGen.new

    assert_equal 5, k.key.length
  end

  def test_key_gen_outputs_unique_values
    key_1 = KeyGen.new
    key_2 = KeyGen.new

    refute_equal key_1, key_2
  end
end
