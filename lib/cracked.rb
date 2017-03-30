# Run through every five digit combination.
#
# Plugin every combination as key and assessing whether the value of the last seven digits is ..end..
#
# When we determine what the correct key is
require 'pry'
require 'pry-state'

class Cracked
  attr_reader :output, :generated_potential_key, :encrypted_key, :formatted_date, :potent_key, :end_of_message, :potent_offsets

  def initialize(output, date)
    @output = output
    @formatted_date = date
    @generated_potential_key = []
    @encrypted_key = 10000
    @char_map = CharacterMap.new.character_map
    @potent_key = potent_key
    @end_of_message = end_of_message
    @potent_offsets = potent_offsets
  end


  def cracker

    until encrypted_key == 99999

      4.times { |i| generated_potential_key << encrypted_key.to_s.slice(i, 2).to_i}

      encrypted_key += 1


    end

  end

  def potential_offsets
    

  end
  def potent_key_generator
    4.times do |i|
      potent_key << formatted_date[i] + generated_potential_key[i]
    end
  end

  def get_last_seven_digits_from_message
    end_of_message = output[-7..-1].chars
  end

end


  def unrotate_map
    i = 0
    rotated_map.each do |rotation|
      unrotated = rotation.rotate(-first_offset_value_for_last_encrypted_character)#(-offset_values[i])
      decrypted_chars << unrotated.first
      i += 1
      i = 0 if i == 4
    end
    decrypted_chars
  end
  def crack_map
    end_of_message = output[-7..-1].chars
    i = -1
    until i < -7
      end_of_message[i]
      i -= 1
    end
    rotated_map.each do |rotation|
    end
  end

  def offset_valuator
    first_offset_value_for_last_encrypted_character = character_map.index(end_of_message[-1]) - character_map.index(".")
    second_offset_value = rotated_map.index(end_of_message[-2]) - rotated_map.index(".")
    third_offset_value = rotated_map.index(end_of_message[-3]) - rotated_map.index("d")
    fourth_offset_value = rotated_map.index(end_of_message[-4]) - rotated_map.index("n")
    reversed_rotated_map = rotated_map.reverse
    


    unencrypted_message.reverse #since going through backwards, need to reverse back after reversing map
    
  #   encryption_length = rotated_map.length
  #   i = encryption_length  
  #     until i < 0
  #       rotated_map[i]

  #     i -= 1
  #     end
  # end
#rotation = index + offset

puts generated_potential_key
binding.pry
""
# until "..end.." == found_message
#
#
#
#
# end
