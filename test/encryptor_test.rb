require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/encryptor'

class EncryptorTest < Minitest::Test

  def test_class_exists
    e = Encryptor.new

    assert_instance_of Encryptor, e
  end

  def test_offset_values_change_in_new_instances
    e_1 = Encryptor.new.offset_values
    e_2 = Encryptor.new.offset_values

    refute_equal e_2, e_1
  end

  def test_character_map_stays_constant
    e_1 = Encryptor.new.character_map
    e_2 = Encryptor.new.character_map

    assert_equal e_2, e_1
  end

  def test_message_file_loads
    e = Encryptor.new

    refute_nil e.message
  end

  def test_message_has_contents
    e = Encryptor.new

    refute_equal e.message, ""
  end

  def test_each_instance_outputs_different_encryptor
    e_1 = Encryptor.new.encryptor
    e_2 = Encryptor.new.encryptor

    refute_equal e_2, e_1
  end

  def test_first_character_in_message_is_also_in_map
    e = Encryptor.new
    test = e.character_map.include?(e.message[0])

    assert test
  end

  def test_every_character_in_message_is_in_map
    e = Encryptor.new
    new_message = e.message.chomp.chars
    test = new_message.all? do |char|
      e.character_map.include?(char)
    end

    assert test
  end

  def test_character_can_be_grabbed
    e = Encryptor.new
    char = e.get_char

    refute_nil char
  end

  def test_message_can_be_grabbed
    e = Encryptor.new("./lib/hello.txt")
    message = e.message

    assert_equal "hello", message
  end

  def test_map_index_pulls_return_from_get_char
    e = Encryptor.new
    e.map_index

    refute_nil e.map_index
  end

  def test_char_index_value_on_map
    e = Encryptor.new
    index = e.character_map.index(" ")

    assert_equal 0, index
  end

  def test_offset_array_has_four_values
    e = Encryptor.new
    offset_length = e.offset_values.length

    assert_equal 4, offset_length
  end

  def test_first_offset_value_plus_index_value_returns_rotation_value
    e = Encryptor.new
    index = e.map_index[0]
    rotation_values = index + e.offset_values[0]

    assert rotation_values > index
  end

  def test_map_rotates_to_place_encryptorion_value_at_index_zero
    e = Encryptor.new
    rotate = e.character_map.rotate(1)

    assert_equal "!", rotate[0]
  end

end
