require 'pry'

class Enigma

  def initialize(message = "", key = 0, date = nil)
    @message = message
    @key = key
    @date = date
  end

  def key_generator
    key = Random.new
    key = key.rand(10000..99999)
  end

  def encrypt


  end

  def decrypt

  end

  def crack

  end

end
