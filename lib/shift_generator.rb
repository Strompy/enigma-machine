require './lib/offset_generator'

class ShiftGenerator < OffsetGenerator
  attr_reader :shifts
  def initialize
    @shift = {}
    @char_array = ("a".."z").to_a << " "
    @shifts = []
    super
  end

  def create_shift
    self.create_key_hash
    @shift = key_hash.merge(offset_hash) do |symbol, key_value, offset_value|
      key_value.to_i + offset_value.to_i
    end
  end

  def create_shifts_array
    @shift.map do |symbol, shift|
      @shifts << @char_array.zip(@char_array.rotate(shift)).to_h
    end
  end

end
