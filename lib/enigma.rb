require 'pry'

class Enigma
  attr_reader :key

  def initialize
    @message = ""
    @key = key
    @date = nil
    @a = 0
    @b = 0
    @c = 0
    @d = 0
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


  end

  def decrypt

  end

  def crack

  end

end
