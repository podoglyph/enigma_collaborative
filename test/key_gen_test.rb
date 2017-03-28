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
end
