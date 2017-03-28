    encrypted_message = "this is a secret message ..end.."
    decrypted_message = ""
    i = 0
    j = 1
    k = 2
    l = 3

    until encrypted_message.length == decrypted_message.length
      break if message[i].nil?
      rotate_index = character_map.index(message[i])
      decrypted_char = character_map.rotate(-(rotate_index + @a)[0]
      decrypted_message << decrypted_char
      break if message[j].nil?  
      rotate_index = character_map.index(message[j])
      decrypted_char = character_map.rotate(-(rotate_index + @b)[0]
      decrypted_message << decrypted_char
      break if message[k].nil?  
      rotate_index = character_map.index(message[k])
      decrypted_char = character_map.rotate(-(rotate_index + @c)[0]
      decrypted_message << decrypted_char
      break if message[l].nil?  
      rotate_index = character_map.index(message[l])
      decrypted_char = character_map.rotate(-(rotate_index + @d))[0]
      decrypted_message << decrypted_char
      i += 4
      j += 4
      k += 4
      l += 4
    end
    
    puts decrypted_message