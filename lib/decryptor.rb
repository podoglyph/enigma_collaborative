require './lib/character_map'
require './lib/offset_calc'
require './lib/encryptor'

class Decryptor
    attr_reader :output

    def initialize(output, key, date = nil)
      @decrypted_message = ""
      @output = output
    end


end
