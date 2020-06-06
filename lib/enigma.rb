require 'Date'

class Enigma

def initialize(file, shift = shift, date = Date.today)
  @file = file
  @shift = shift
  @date = date
end
end
