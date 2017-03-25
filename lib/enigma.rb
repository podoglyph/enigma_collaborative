require 'pry'

class Enigma

  def initialize(message = "", key = 0, date = nil)
    @message = message
    @key = key
    @date = date
  end

  def key_generator
    key = Random.new
    key = key.rand(10000..99999)
    key = key.to_s
  end

  def assign_rotation
    a_rotation = key_generator[0] + key_generator[1]
    b_rotation = key_generator[1] + key_generator[2]
    c_rotation = key_generator[2] + key_generator[3]
    d_rotation = key_generator[3] + key_generator[4]

  end

  def get_date_as_string
    offset = Time.now.strftime("%d%m%y")
    squared_offset = offset.to_i ** 2
    squared_offset.to_s
  end

  def generate_offsets
    a_offsets = get_date_as_string[-4].to_i
    b_offsets = get_date_as_string[-3].to_i
    c_offsets = get_date_as_string[-2].to_i
    d_offsets = get_date_as_string[-1].to_i
  end

  def offsetter

  end

  def encrypt


  end

  def decrypt

  end

  def crack

  end

end

e = Enigma.new
binding.pry
""
