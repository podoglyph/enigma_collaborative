require 'pry'
require 'pry-state'
require './lib/key_gen.rb'

class OffsetCalc
  attr_reader :new_key, :rotation_values, :format_date,
  :final_offsets, :key, :date

  def initialize
    @new_key = KeyGen.new.key
    @key = new_key
    @date = date
    @rotation_values = Array.new(4, nil)
    @format_date = format_date
    @final_offsets = []
    run
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
    i = 0
    until final_offsets.length == rotation_values.length
      final_offsets << format_date[i] + rotation_values[i]
      i += 1
    end
  end

  def square_date
    @date = Time.now.strftime("%d%m%y").to_i
    format_date = date ** 2
    format_date = format_date.to_s
    format_date = format_date[-4, 4].chars
    @format_date = format_date.map! { |x| x.to_i}
  end

  def run
    assign_rotation
    add_offsets_to_rotation
  end

end
