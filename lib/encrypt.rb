require './lib/character_map'
require './lib/offset_calc'
require 'pry'
require 'pry-state'
class Encrypt  
  attr_reader :character_map, :message
  attr_accessor :encrypted_message

  def initialize
    @character_map = CharacterMap.new.character_map
    @offset_calc = OffsetCalc.new
    @message = "this is a secret message ..end.."
    @encrypted_message = ""
    run
  end

  def run
    index_a = 0
    index_b = 1
    index_c = 2
    index_d = 3

    until message.length == encrypted_message.length
      break if message[index_a].nil?
      rotate_index = character_map.index(message[index_a])
      encrypted_char = character_map.rotate(rotate_index + @offset_calc.final_offsets[0])[0]
      encrypted_message << encrypted_char
      break if message[index_b].nil?  
      rotate_index = character_map.index(message[index_b])
      encrypted_char = character_map.rotate(rotate_index + @offset_calc.final_offsets[1])[0]
      encrypted_message << encrypted_char
      break if message[index_c].nil?  
      rotate_index = character_map.index(message[index_c])
      encrypted_char = character_map.rotate(rotate_index + @offset_calc.final_offsets[2])[0]
      encrypted_message << encrypted_char
      break if message[index_d].nil?  
      rotate_index = character_map.index(message[index_d])
      encrypted_char = character_map.rotate(rotate_index + @offset_calc.final_offsets[3])[0]
      encrypted_message << encrypted_char
      index_a += 4
      index_b += 4
      index_c += 4
      index_d += 4
      
    end
    
    puts encrypted_message
  end

end
binding.pry
""