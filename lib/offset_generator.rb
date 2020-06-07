require 'Date'
require './lib/key_generator'

class OffsetGenerator < KeyGenerator
attr_reader :date
  def initialize
    @date = Date.today.strftime('%d%m%Y')
  end

  def generate_date
    Date.today.strftime('%d%m%Y')
  end

  def create_offset
    generate_date
    square = (date.to_i)**2
    offset = square.to_s
    offset[-4..-1]
  end

  def offset_hash
    offset = create_offset
    offset_hash = {:A => offset[0],
    :B => offset[1],
    :C => offset[2],
    :D => offset[3]
    }
    offset_hash
  end

end
