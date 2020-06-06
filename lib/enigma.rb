require 'Date'

class Enigma
  attr_reader :file, :shift, :date, :char_array

  def initialize(file, shift = nil, date = Enigma.format_date)
    @file = file
    @shift = shift
    @date = date
    @char_array = ("a".."z").to_a << " "
  end

  def self.format_date
    test = Date.today
    test.strftime('%d%m%Y')
  end

  def create_key
    key = rand(100_000).to_s.rjust(5, '0')
  end
end
