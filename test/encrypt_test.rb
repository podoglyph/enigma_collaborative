require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/encrypt'

class EncryptTest < Minitest::Test

  def test_class_exists
    e = Encrypt.new

    assert_instance_of Encrypt, e
  end

  def test_reset_calc_equal_offset_calc
    e = Encrypt.new
    reset_calc = e.offset_calc

    assert_equal e.offset_calc, reset_calc
  end

  def test_offset_values_change_in_new_instances
    e_1 = Encrypt.new.offset_calc
    e_2 = Encrypt.new.offset_calc

    refute_equal e_2, e_1
  end

  def test_character_map_stays_constant
    e_1 = Encrypt.new.character_map
    e_2 = Encrypt.new.character_map

    assert_equal e_2, e_1
  end

  def test_message_file_loads
    e = Encrypt.new

    refute_nil e.message
  end

  def test_message_has_contents
    e = Encrypt.new

    refute_equal e.message, ""
  end

  def test_each_instance_outputs_different_encryption
    e_1 = Encrypt.new.encrypt
    e_2 = Encrypt.new.encrypt

    refute_equal e_2, e_1
  end

  def test_first_character_in_message_is_also_in_map
    e = Encrypt.new
    test = e.character_map.include?(e.message[0])

    assert test
  end

  def test_every_character_in_message_is_in_map
    e = Encrypt.new
    new_message = e.message.chomp.chars
    test = new_message.all? do |char|
      e.character_map.include?(char)
    end

    assert test
  end

  def test_character_can_be_grabbed
    e = Encrypt.new
    char = e.get_char

    refute_nil char
  end

  def test_message_can_be_grabbed
    e = Encrypt.new("./lib/hello.txt")
    message = e.message

    assert_equal "hello", message
  end

  def test_map_index_pulls_return_from_get_char
    e = Encrypt.new
    e.map_index

    refute_nil e.map_index
  end

  def test_char_index_value_on_map
    e = Encrypt.new
    index = e.character_map.index(" ")

    assert_equal 0, index
  end

  def test_offset_array_has_four_values
    e = Encrypt.new
    offset_length = e.offset_calc.length

    assert_equal 4, offset_length
  end

  def test_first_offset_value_plus_index_value_returns_rotation_value
    e = Encrypt.new
    index = e.map_index[0]
    rotation_values = index + e.offset_calc[0]

    assert rotation_values > index
  end

  def test_map_rotates_to_place_encryption_value_at_index_zero
    e = Encrypt.new
    rotate = e.character_map.rotate(1)

    assert_equal "!", rotate[0]
  end

end
