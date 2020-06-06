require 'Date'

class Enigma
  attr_reader :file, :shift, :date, :char_array

  def initialize(file, shift = shift, date = Enigma.format_date)
    @file = file
    @shift = shift
    @date = date
    @char_array = ("a".."z").to_a << " "
  end

  def self.format_date
    test = Date.today
    test.strftime('%d%m%Y')
  end
end
