require './lib/character_map'
require './lib/offset_calc'
require './lib/encryptor'

class Decryptor
    attr_reader :output, :input, :map_index_values, :character_map, :chars_in_message, 
        :values, :offset_values, :rotated_map, :decrypted_message, :key, :rotated_map,
        :decrypted_chars, :today_date

    def initialize(input, key, date, offset, rotated_map)
      @key = key
      @input = input
      @map_index_values = []
      @values = []
      @decrypted_message = ""
      @rotated_map = rotated_map
      @offset_values = offset
      @character_map = CharacterMap.new.character_map
      @decrypted_chars = []
      @today_date = date
    end

    def unrotate_map
      i = 0
      rotated_map.each do |rotation|
        unrotated = rotation.rotate(-offset_values[i])
        decrypted_chars << unrotated.first
        i += 1
        i = 0 if i == 4
      end
      decrypted_chars
    end

    def decryptor
      unrotate_map
      @decrypted_message << decrypted_chars.join
      decrypted_file = File.open("./lib/decrypted.txt", "w")
      decrypted_file.write(decrypted_message)
      p "Created 'decrypted.txt' with the key #{key} and date #{today_date} "

    end

end

# d = Decryptor.new("+%;JR", "62348", date = nil, offset = [22,33,44,55], rotated_map)
# d.decryptor
