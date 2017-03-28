require 'pry'
require 'pry-state'

class KeyGen
  attr_reader :key

  def initialize
    key = Random.new
    @key = key
    run
  end

  def key_gen
    @key = @key.rand(10000..99999).to_s
  end

  def run
    key_gen
  end

end
