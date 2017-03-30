require 'pry'
require 'pry-state'
require './lib/encryptor.rb'
require './lib/decryptor.rb'

class Enigma
  attr_reader :my_message, :key, :offset, :rotated_map,

              :character_map

  def initialize
    @my_message = my_message
    @offset = nil
    @rotated_map = nil

    @character_map = (' '..'z').to_a
  end

  def encrypt(my_message, key = nil, date = nil)
    encryption = Encryptor.new(my_message)
    encryption.encryptor
    @key = encryption.offset_calc.key
    # @formatted_date = encryption.offset_calc.formatted_date
    @formatted_date = encryption.offset_calc.format_date
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
    end_of_message = output[-7..-1].chars
    crack_offset_values = []
    cracked_chars = []
    offset_value_for_last_encrypted_character = character_map.index(end_of_message[-1]) - character_map.index(".")
    crack_offset_values << offset_value_for_last_encrypted_character
    offset_value_for_second_last_encrypted_character = character_map.index(end_of_message[-2]) - character_map.index(".")
    crack_offset_values << offset_value_for_second_last_encrypted_character
    offset_value_for_third_last_encrypted_character = character_map.index(end_of_message[-3]) - character_map.index("d")
    crack_offset_values << offset_value_for_third_last_encrypted_character
    first_offset_value_for_last_encrypted_character = character_map.index(end_of_message[-4]) - character_map.index("n")
    crack_offset_values << first_offset_value_for_last_encrypted_character
    reversed_rotated_map = rotated_map.reverse
    i = 0
    reversed_rotated_map.each do |rotation|
      unrotated = rotation.rotate(-crack_offset_values[i])
      cracked_chars << unrotated.first
      i += 1
      i = 0 if i == 4
    end    
    cracked_message = cracked_chars.reverse.join
    p cracked_message
    
    
  end


end
