require 'Date'

class Enigma
  attr_reader :file, :shift, :date

  def initialize(file, shift = shift, date = Enigma.format_date)
    @file = file
    @shift = shift
    @date = date
  end

  def self.format_date
    test = Date.today
    test.strftime('%d%m%Y')
  end
end
