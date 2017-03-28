require './lib/character_map'
require './lib/offset_calc'
#require './lib/message.txt'
require 'pry'
require 'pry-state'
class Encrypt  
  attr_reader :character_map, :message, :reset_calc, :offset_calc, :rotated_map
  attr_accessor :encrypted_message

  def initialize
    @character_map = CharacterMap.new.character_map
    @offset_calc = OffsetCalc.new.final_offsets
    @reset_calc = @offset_calc
    @message = File.read("./lib/message.txt")#"this is a secret message ..end.."
    @encrypted_message = ""
  end

  def get_char
    message[0]
  end

  def map_index
    character_map.index(get_char)

  end

  def rotation_value
    value = map_index + offset_calc[0]
  end

  def rotate_map
    @rotated_map = character_map.rotate(rotation_value)
  end
  
  def encrypt
    rotate_map
    @encrypted_message << rotated_map[0]
  end

end

# e = Encrypt.new
# puts e.encrypt

# binding.pry
""