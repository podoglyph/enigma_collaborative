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

  def test_assign_rotation_accesses_generated_key
    e = Enigma.new
    key = e.key_generator
    rotated = e.assign_rotation

    assert_equal (key[3] + key[4]).to_i, rotated
  end

  def test_getting_the_date
    #this test is dependant on today's date
    e = Enigma.new
    date = e.get_date_as_string

    assert_equal "73071280489", date
  end

  def test_offset_generation
    #this is also dependant on today's date
    e = Enigma.new
    e.get_date_as_string
    offsetter = e.add_offsets_to_rotation#generate_offsets

    assert_equal 9, offsetter
  end

  def test_encryption_values_are_set
    skip
    e = Enigma.new
    key = "12345"
    e.assign_rotation
    value = e.add_offsets_to_rotation#generate_offsets
    #value = e.encryption_value

    assert_equal 54, value
  end

end
