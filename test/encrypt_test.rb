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
    reset_calc = e.offset_calc.final_offsets

    assert_equal e.offset_calc.final_offsets, reset_calc
  end

  def test_each_instance_outputs_different_encryption
    e_1 = Encrypt.new.encrypted_message
    e_2 = Encrypt.new.encrypted_message

    refute_equal e_2, e_1
  end

  def test_offset_values_change_in_new_instances
    e_1 = Encrypt.new.offset_calc.final_offsets
    e_2 = Encrypt.new.offset_calc.final_offsets

    refute_equal e_2, e_1
  end

  def test_character_map_stays_constant
    e_1 = Encrypt.new.character_map
    e_2 = Encrypt.new.character_map

    assert_equal e_2, e_1
  end


end