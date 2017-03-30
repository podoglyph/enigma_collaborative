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





puts generated_potential_key
binding.pry
""
# until "..end.." == found_message
#
#
#
#
# end
