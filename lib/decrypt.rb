    encrypted_message = "this is a secret message ..end.."
    decrypted_message = ""

    def run
    index_a = 0
    index_b = 1
    index_c = 2
    index_d = 3

    until encrypted_message.length == decrypted_message.length
      break if message[index_a].nil?
      rotate_index = character_map.index(message[index_a])
      decrypted_char = character_map.rotate(-(rotate_index + @offset_calc.final_offsets[0])[0]
      decrypted_message << decrypted_char
      break if message[index_b].nil?  
      rotate_index = character_map.index(message[index_b])
      decrypted_char = character_map.rotate(-(rotate_index + @offset_calc.final_offsets[1])[0]
      decrypted_message << decrypted_char
      break if message[index_c].nil?  
      rotate_index = character_map.index(message[index_c])
      decrypted_char = character_map.rotate(-(rotate_index + @offset_calc.final_offsets[2])[0]
      decrypted_message << decrypted_char
      break if message[index_d].nil?  
      rotate_index = character_map.index(message[index_d])
      decrypted_char = character_map.rotate(-(rotate_index + @offset_calc.final_offsets[3]))[0]
      decrypted_message << decrypted_char
      i += 4
      j += 4
      k += 4
      l += 4
    end
    
    puts decrypted_message