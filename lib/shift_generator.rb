require './lib/offset_generator'

class ShiftGenerator < OffsetGenerator

  def initialize
    @shift = {}
    super
  end

  def create_shift
    self.create_key_hash
    @shift = key_hash.merge(offset_hash) do |symbol, key_value, offset_value|
      key_value.to_i + offset_value.to_i
    end
  end

end
