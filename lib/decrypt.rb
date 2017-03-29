require './lib/character_map'
require './lib/offset_calc'
require './lib/encrypt'

class Decrypt    
    attr_reader :output, :access_key
    def initialize(output = "./lib/encrypted.txt", access_key = "./lib/key.txt")
      @decrypted_message = ""
      @output = File.read(output)
      @access_key = File.read(access_key)

    end

    

end
