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
  end

  def get_date_as_string
    offset = Time.now.strftime("%d%m%y")
    squared_offset = offset.to_i ** 2
    squared_offset.to_s
  end

  def generate_offsets
    a = get_date_as_string[-1]
    b = get_date_as_string[-2]
    c = get_date_as_string[-3]
    d = get_date_as_string[-4]
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