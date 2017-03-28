require 'pry'
require 'pry-state'
require './lib/key_gen.rb'

class OffsetCalc
  attr_reader :a, :b, :c, :d, :new_key, :rotation_values, :format_date

  def initialize
    @a = 0
    @b = 0
    @c = 0
    @d = 0
    @rotation_values = Array.new(4, nil)
    @new_key = KeyGen.new.key
    @date = nil
    @format_date = format_date
  end

  def assign_rotation
    i = 0
    j = 1
    @rotation_values.each do |x|
      x = (new_key[i] + new_key[j]).to_i
      @rotation_values[i] = x
      i += 1
      j += 1
    end
  end

  def add_offsets_to_rotation
    square_date

    @a = format_date[0].to_i + rotation_values[0]
    @b = format_date[1].to_i + rotation_values[1]
    @c = format_date[2].to_i + rotation_values[2]
    @d = format_date[3].to_i + rotation_values[3]
  end

  def square_date
    format_date = Time.now.strftime("%d%m%y").to_i
    format_date = format_date ** 2
    format_date = format_date.to_s
    @format_date = format_date[-4, 4]
  end

end

o = OffsetCalc.new
o.assign_rotation
o.add_offsets_to_rotation

""
