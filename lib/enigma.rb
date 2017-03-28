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

  def get_date_as_string
    offset = Time.now.strftime("%d%m%y")
    squared_offset = offset.to_i ** 2
    squared_offset.to_s
  end


  def decrypt

  end

  def crack

  end

end

e = Enigma.new
e.assign_rotation
binding.pry
""
