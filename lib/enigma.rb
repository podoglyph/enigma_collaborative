require 'pry'
require 'pry-state'
require './lib/key_gen.rb'
require './lib/offset_calc.rb'

class Enigma
  attr_reader :character_map

  def initialize
    @message = ""
    #@TODO Add space, comma, period
    @character_map = ('a'..'z').to_a
  end

  def decrypt

  end

  def crack

  end

end

e = Enigma.new
