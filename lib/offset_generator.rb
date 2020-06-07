require 'Date'
class OffsetGenerator
attr_reader :date
  def initialize
    @date = Date.today.strftime('%d%m%Y')
  end

  def generate_date
    Date.today.strftime('%d%m%Y')
  end

  def create_offset
    square = (date.to_i)**2
    offset = square.to_s
    offset[-4..-1]
  end

end
