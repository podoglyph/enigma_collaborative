#require 'simplecov'
#SimpleCov.start

require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/offset_calc.rb'

class OffsetCalcTest < Minitest::Test

  def test_offset_calc_exists
    o = OffsetCalc.new

    assert OffsetCalc
  end

  def test_offset_calc_can_access_new_key
    o = OffsetCalc.new

    assert o.new_key
  end

  def test_assign_rotation_populates_array
    o = OffsetCalc.new
    o.assign_rotation
    test = o.rotation_values.include?(nil)

    refute test
  end

  def test_assign_rotation_values_are_two_digits
    o = OffsetCalc.new
    o.assign_rotation
    test_digits = o.rotation_values.detect { |x| x < 10 or x > 99 }

    assert test_digits.nil?
  end

  def test_add_offsets_to_rotation
    o = OffsetCalc.new
    o.assign_rotation
    o.add_offsets_to_rotation

    refute_equal 0, o.a
    refute_equal 0, o.b
    refute_equal 0, o.c
    refute_equal 0, o.d

  end


end
