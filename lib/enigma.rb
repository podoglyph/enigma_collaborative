require 'pry'
require 'pry-state'
require './lib/encryptor.rb'
require './lib/decryptor.rb'

class Enigma
  attr_reader :my_message, :key, :offset, :rotated_map

  def initialize
    @my_message = my_message
    @offset = nil
    @rotated_map = nil
  end

  def encrypt(my_message, key = nil, date = nil)
    encryption = Encryptor.new(my_message)
    encryption.encryptor
    @key = encryption.offset_calc.key
    @formatted_date = encryption.offset_calc.formatted_date
    @the_date = encryption.offset_date
    @offset = encryption.offset_values
    @rotated_map = encryption.rotated_map
    encryption.encrypted_message
  end

  def decrypt(output, key, date = nil)
    decryption = Decryptor.new(output, @key, date = @the_date, offset = @offset, rotated_map = @rotated_map)
    decryption.decryptor
    decryption.decrypted_message
    #we want to return the decrypted message here.
  end

  def crack(output, date = @formatted_date)

  end


end
