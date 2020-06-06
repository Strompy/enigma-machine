require 'Date'

class Enigma
attr_reader :file, :shift, :date
def initialize(file, shift = shift, date = Date.today)
  @file = file
  @shift = shift
  @date = date
end
end
