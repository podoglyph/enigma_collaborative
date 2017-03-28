require 'pry'
require 'pry-state'
require './lib/key_gen.rb'
require './lib/offset_calc.rb'

class Enigma
  attr_reader :character_map

  def initialize
    @message = ""
  end

end

e = Enigma.new
