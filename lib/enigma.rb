require 'pry'
require 'pry-state'
require './lib/encryptor.rb'
require './lib/decryptor.rb'

class Enigma
  attr_reader :my_message, :key

  def initialize
    @my_message = my_message
  end

  def encrypt(my_message, key = nil, date = nil)
    encryption = Encryptor.new(my_message)
    encryption.encryptor
    @key = encryption.offset_calc.key
    @offset = encryption.offset_calc.offset_values
    encryption.encrypted_message
  end

  def decrypt(output, key=nil, date = nil)
    decryption = Decryption.new
  end

  def crack(output, date = nil)

  end
  

end
# binding.pry
# ""