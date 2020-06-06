require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    file = File.open('./message.txt', 'r')
    enigma = Enigma.new(file)
    assert_instance_of Enigma , enigma
  end

  def test_it_has_attributes
    file = File.open('./message.txt', 'r')
    enigma = Enigma.new(file, 01234)
    assert_equal file, enigma.file
    assert_equal 01234, enigma.shift
    assert_equal Date.today, enigma.date
  end
end
