require 'pry'
require 'pry-state'
require './lib/key_gen.rb'
require './lib/offset_calc.rb'

class Enigma
  attr_reader :character_map, :new_key, :rotation_values

  def initialize
    @new_key = KeyGen.new.key
    @message = ""
    @date = nil
    @rotation_values = Array.new(4, nil)
    #@TODO Add space, comma, period
    @character_map = ('a'..'z').to_a
  end

  def assign_rotation
    i = 0
    j = 1
    @rotation_values.map do |x|
      #binding.pry
      x = (new_key[i] + new_key[j]).to_i
      @rotation_values[i] = x
      #binding.pry
      i += 1
      j += 1
    end
  end

  def get_date_as_string
    offset = Time.now.strftime("%d%m%y")
    squared_offset = offset.to_i ** 2
    squared_offset.to_s
  end

  def add_offsets_to_rotation
    @a += get_date_as_string[-4].to_i
    @b += get_date_as_string[-3].to_i
    @c += get_date_as_string[-2].to_i
    @d += get_date_as_string[-1].to_i
  end

  def decrypt

  end

  def crack

  end

end

e = Enigma.new
e.assign_rotation
#binding.pry
""
