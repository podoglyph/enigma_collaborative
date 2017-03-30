require './lib/character_map'
require './lib/offset_calc'
require './lib/encryptor'

class Decryptor
    attr_reader :output, :input, :map_index_values, :character_map, :chars_in_message, :values, :offset_values, :rotated_map, :decrypted_message, :key

    def initialize(input, key, date = nil, offset)
      @key = key
      @input = input
      @map_index_values = []
      @values = []
      @decrypted_message = ""
      @rotated_map = []
      @offset_values = offset
      @character_map = CharacterMap.new.character_map
    end

    def get_encrypted_chars
      @chars_in_message = input.chomp.chars
    end

    def map_index_encrypted
      get_encrypted_chars
      chars_in_message.map do |char|
        map_index_values << character_map.index(char)
      end
      map_index_values

    end

    def encrypted_rotation_value
      map_index_encrypted
      i = 0
      map_index_values.map do |index|
        values << index + offset_values[i]
        i += 1
        i = 0 if i == 4
      end
      values
    end

    def rotate_map
      encrypted_rotation_value
       @values.map do |value|
         rotated_map << character_map.rotate(value).first
       end
       rotated_map
    end

    def decryptor
      rotate_map
      @decrypted_message << rotated_map.join
      decrypted_file = File.open("./lib/decrypted.txt", "w")
      decrypted_file.write(decrypted_message)
      p "Created 'decrypted.txt' with the key #{key} and date #{343433} "

    end

end

d = Decryptor.new("+%;JR", "62348", date = nil, offset = [22,33,44,55])
d.decryptor
