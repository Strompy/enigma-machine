require 'Date'
require './lib/shift_generator'

class Enigma < ShiftGenerator
  attr_reader :char_array, :message, :key, :date, :shift

  def initialize(message, key = KeyGenerator.new.create_key, date = OffsetGenerator.new.date)
    # super
    @char_array = ("a".."z").to_a << " "
    @message = message
    @key = key
    @date = date
  end


end
