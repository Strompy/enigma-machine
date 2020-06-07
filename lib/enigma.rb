require 'Date'

class Enigma < ShiftGenerator
  attr_reader :char_array, :message, :key, :date, :shift

  def initialize(message, key = KeyGenerator.new.create_key, date = OffsetGenerator.new.date)
    @char_array = ("a".."z").to_a << " "
    @message = message
    @key = key
    @date = date
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
