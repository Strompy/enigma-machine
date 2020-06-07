require 'Date'

class Enigma
  attr_reader :message, :key, :date, :char_array

  def initialize(message, key = Enigma.create_key, date = Enigma.format_date)
    @message = message
    @key = key
    @date = date
    @char_array = ("a".."z").to_a << " "
    @shift = {}
  end

  def self.format_date
    test = Date.today
    test.strftime('%d%m%Y')
  end

  def create_offset
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

  def create_shift
    @shift = key_hash.merge(offset_hash) do |symbol, key_value, offset_value|
      key_value.to_i + offset_value.to_i
    end
  end
end
