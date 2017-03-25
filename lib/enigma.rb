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
    a_rotation = key_generator[0].to_i + key_generator[1].to_i
    b_rotation = key_generator[1].to_i + key_generator[2].to_i
    c_rotation = key_generator[2].to_i + key_generator[3].to_i
    d_rotation = key_generator[3].to_i + key_generator[4].to_i

  end

  def get_date_as_string
    offset = Time.now.strftime("%d%m%y")
    squared_offset = offset.to_i ** 2
    squared_offset.to_s
  end

  def generate_offsets
    a_offset = get_date_as_string[-4].to_i
    b_offset = get_date_as_string[-3].to_i
    c_offset = get_date_as_string[-2].to_i
    d_offset = get_date_as_string[-1].to_i
  end

  def encryption_value
    a = a_rotation + a_offset
    b = b_rotation + b_offset
    c = c_rotation + c_offset
    d = d_rotation + d_offset
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
