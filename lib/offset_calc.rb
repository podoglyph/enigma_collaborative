require 'pry'
require 'pry-state'

class OffsetCalc

  def initialize

  end

  def assign_rotation
    i = 0
    j = 1
    @rotation_values.map do |x|
      #binding.pry
      x = (new_key[i] + new_key[j]).to_i
      @rotation_values[i] = x
      #binding.pry
      i += 1
      j += 1
    end
  end

  def add_offsets_to_rotation
    @a += get_date_as_string[-4].to_i
    @b += get_date_as_string[-3].to_i
    @c += get_date_as_string[-2].to_i
    @d += get_date_as_string[-1].to_i
  end

end
