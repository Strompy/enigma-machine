require './test/test_helper'
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
    assert_equal 01234, enigma.key
    assert_equal Date.today, enigma.date
    assert_equal 27, enigma.char_array.count
  end

  def test_it_can_format_date
    file = File.open('./message.txt', 'r')
    Date.stubs(:today).returns(Date.new(2020, 06, 06))
    enigma = Enigma.new(file, 01234)
    assert_equal '06062020', enigma.date
  end

  def test_it_can_create_key
    file = File.open('./message.txt', 'r')
    Enigma.stubs(:rand).returns(1234)
    enigma = Enigma.new(file)
    expected_key = "01234"
    assert_equal 5, enigma.key.length
    assert_equal expected_key, enigma.key
  end

  def test_it_can_make_key_hash
    file = File.open('./message.txt', 'r')
    enigma = Enigma.new(file, "01234")
    expected = {:A => "01",
    :B => "12",
    :C => "23",
    :D => "34"
    }

    assert_equal expected, enigma.key_hash
  end

  def test_it_can_make_offset
    file = File.open('./message.txt', 'r')
    Date.stubs(:today).returns(Date.new(2020, 06, 06))
    enigma = Enigma.new(file)
    expected = "0400"
    assert_equal expected, enigma.create_offset
  end


  def test_it_can_make_offset_hash
    file = File.open('./message.txt', 'r')
    Date.stubs(:today).returns(Date.new(2020, 06, 06))
    enigma = Enigma.new(file)
    expected = {:A => "0",
    :B => "4",
    :C => "0",
    :D => "0"
    }

    assert_equal expected, enigma.offset_hash
  end

  def test_it_can_make_shift_hash_without_key_and_date
    file = File.open('./message.txt', 'r')
    Date.stubs(:today).returns(Date.new(2020, 06, 06))
    Enigma.stubs(:rand).returns(1234)
    enigma = Enigma.new(file)
    expected = {:A => 1,
    :B => 16,
    :C => 23,
    :D => 34
    }
    assert_equal expected, enigma.create_shift
  end

  def test_it_can_make_shift_hash_with_key_and_date
    file = File.open('./message.txt', 'r')
    enigma = Enigma.new(file, "02715", "040895")
    expected = {:A => 3,
    :B => 27,
    :C => 73,
    :D => 20
    }
    assert_equal expected, enigma.create_shift
  end

end
