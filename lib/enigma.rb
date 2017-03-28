require 'pry'
require 'pry-state'
require './lib/key_gen.rb'
require './lib/offset_calc.rb'

class Enigma
  attr_reader :character_map

  def initialize
    @message = ""
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
