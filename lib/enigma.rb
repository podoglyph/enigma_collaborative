require 'pry'
require 'pry-state'
require './lib/key_gen.rb'

class Enigma
  attr_reader :character_map, :new_key

  def initialize
    @new_key = KeyGen.new.key
    @message = ""
    @a, @b, @c, @d, @date = nil
    #@TODO Add space, comma, period
    @character_map = ('a'..'z').to_a
  end

  def assign_rotation
    @a = (new_key[0] + new_key[1]).to_i
    @b = (new_key[1] + new_key[2]).to_i
    @c = (new_key[2] + new_key[3]).to_i
    @d = (new_key[3] + new_key[4]).to_i

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
binding.pry
""
