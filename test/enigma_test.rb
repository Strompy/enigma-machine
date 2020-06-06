require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require 'mocha/minitest'

class EnigmaTest < Minitest::Test

  def test_it_exists
    file = File.open('./message.txt', 'r')
    enigma = Enigma.new(file)
    assert_instance_of Enigma , enigma
  end

  def test_it_has_attributes
    file = File.open('./message.txt', 'r')
    enigma = Enigma.new(file, 01234, Date.today)
    assert_equal file, enigma.file
    assert_equal 01234, enigma.shift
    assert_equal Date.today, enigma.date
  end

  def test_it_can_format_date
    file = File.open('./message.txt', 'r')
    enigma = Enigma.new(file, 01234)
    Date.stubs(:today).returns(Date.new(2020, 06, 06))
    assert_equal '06062020', enigma.date
  end
end
