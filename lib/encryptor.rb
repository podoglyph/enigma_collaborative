require './lib/character_map'
require './lib/offset_calc'

class Encryptor
  attr_reader :character_map, :message, :offset_values, 
            :offset_calc, :rotated_map, :chars_in_message, 
            :map_index_values, :values, :rotated_map, 
            :encrypted_message

  def initialize(message, key = nil, date = nil)
    @character_map = CharacterMap.new.character_map
    @offset_calc = OffsetCalc.new
    @offset_values = @offset_calc.final_offsets
    @message = message 
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
      values << index + offset_values[i]
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

  def encryptor
    rotate_map
    @encrypted_message << rotated_map.join
    encrypted_file = File.open("./lib/encrypted.txt", "w")
    encrypted_file.write(encrypted_message)
    p "Created 'encrypted.txt' with the key #{offset_calc.key} and date #{offset_calc.date} "
  end

end