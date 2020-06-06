require 'Date'

class Enigma
  attr_reader :file, :key, :date, :char_array

  def initialize(file, key = Enigma.create_key, date = Enigma.format_date)
    @file = file
    @key = key
    @date = date
    @char_array = ("a".."z").to_a << " "
  end

  def self.format_date
    test = Date.today
    test.strftime('%d%m%Y')
  end

  def self.create_key
    rand(100_000).to_s.rjust(5, '0')
  end

  def key_hash
    key_hash = {:A => key[0..1],
    :B => key[1..2],
    :C => key[2..3],
    :D => key[3..4]
    }
    key_hash
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
end
