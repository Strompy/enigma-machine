require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

class EnigmaTest < Minitest::Test

  def test_it_exists
    file = File.open('./message.txt', 'r')
    enigma = Enigma.new(file)
    assert_instance_of Enigma , enigma
  end
end
