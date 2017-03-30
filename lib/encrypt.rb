require './lib/character_map'
require './lib/offset_calc'

class Encrypt
  attr_reader :character_map, :message, :reset_calc,
            :offset_calc, :rotated_map, :chars_in_message,
            :map_index_values, :values, :rotated_map
  attr_accessor :encrypted_message

  def initialize(message = "./lib/message.txt")
    @character_map = CharacterMap.new.character_map
    @offset_calc = OffsetCalc.new.final_offsets
    @reset_calc = @offset_calc
    @message = File.read(message)
    @encrypted_message = ""
    @map_index_values = []
    @values = []
    @rotated_map = []
  end

  def get_char
    @chars_in_message = message.chomp.chars
  end

  def map_index
    get_char
    chars_in_message.map do |char|
      map_index_values << character_map.index(char)
    end
    map_index_values
  end

  def rotation_value
    map_index
    i = 0
    map_index_values.map do |index|
      values << index + offset_calc[i]
      i += 1
      i = 0 if i == 4
    end
    values
  end

  def rotate_map
    rotation_value
     @values.map do |value|
       rotated_map << character_map.rotate(value).first
     end
     rotated_map
  end

  def encrypt
    rotate_map
    @encrypted_message << rotated_map.join
  end

end
