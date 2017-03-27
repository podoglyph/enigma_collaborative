require 'pry'

class Enigma
  attr_reader :key, :character_map

  def initialize
    @message = ""
    @key = key
    @date = nil
    @a = 0
    @b = 0
    @c = 0
    @d = 0
    #@TODO Add space, comma, period
    @character_map = ('a'..'z').to_a
  end

  def key_generator
    key = Random.new
    key = key.rand(10000..99999)
    @key = key.to_s
  end

  def assign_rotation
    @a = (key[0] + key[1]).to_i
    @b = (key[1] + key[2]).to_i
    @c = (key[2] + key[3]).to_i
    @d = (key[3] + key[4]).to_i

  end

  def get_date_as_string
    offset = Time.now.strftime("%d%m%y")
    squared_offset = offset.to_i ** 2
    squared_offset.to_s
  end

  def add_offsets_to_rotation
    @a += get_date_as_string[-4].to_i
    @b += get_date_as_string[-3].to_i
    @c += get_date_as_string[-2].to_i
    @d += get_date_as_string[-1].to_i
  end

  def encrypt
    # 1. Take in the message.
    # 2. Extract four characters at a time.
    # 3. Add encryption values to each character.
    # 4. Output it all to another file.
    # 5. Continue until it's finished.
    message = "This is a secret message ..end.."

    message.each_char do |x|
      i = 0
    end
    new_message = ""
    i = 0
    j = 1
    k = 2
    l = 3

    until message.length == new_message.length
      new_message << character_map.index(message[i])
      new_message << character_map.index(message[j])
      new_message << character_map.index(message[k])
      new_message << character_map.index(message[l])
      i += 4
      j += 4
      k += 4
      l += 4
    end
  end

  def decrypt

  end

  def crack

  end

end

e = Enigma.new
binding.pry
""
