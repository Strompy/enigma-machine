require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/offset_generator'
require './lib/key_generator'
require './lib/shift_generator'
require 'mocha/minitest'

class EnigmaTest < Minitest::Test
  def setup
    @message = "Hello world!"
  end

  def test_it_exists
    file = File.open('./message.txt', 'r')
    enigma = Enigma.new(@message)
    assert_instance_of Enigma , enigma
  end

  def test_it_has_attributes
    Date.stubs(:today).returns(Date.new(2020, 06, 06))
    enigma = Enigma.new(@message, '01234', OffsetGenerator.new.date)
    assert_equal "hello world!", enigma.message
    assert_equal '01234', enigma.key
    assert_equal '06062020', enigma.date
    assert_equal 27, enigma.char_array.count
  end

  def test_it_can_encrypt_with_key_and_date
    Date.stubs(:today).returns(Date.new(2020, 06, 06))
    enigma = Enigma.new(@message, '01234', OffsetGenerator.new.date)
    # enigma.create_shift
    # enigma.create_shifts_array
    expected = 'iuhsppsvsa !'
    assert_equal expected, enigma.encrypt
  end

  def test_it_can_encrypt_character
    Date.stubs(:today).returns(Date.new(2020, 06, 06))
    enigma = Enigma.new(@message, '01234', OffsetGenerator.new.date)
    enigma.create_shift
    enigma.create_shifts_array
    assert_equal 'i', enigma.encrypt_character(0, 'h')
    assert_equal '!', enigma.encrypt_character(1, '!')
    assert_equal 'h', enigma.encrypt_character(2, 'l')
    assert_equal 'p', enigma.encrypt_character(1, ' ')
    assert_equal 's', enigma.encrypt_character(3, 'l')
  end

  def test_it_can_encrypt_without_key_and_date
    Date.stubs(:today).returns(Date.new(2020, 06, 06))
    # @key = KeyGenerator.new
    # @key.stubs(:rand).returns(1234)
    # @key.create_key
    # KeyGenerator.stubs(:rand).returns('0123')
    # @key.stubs(:rand).returns(1234)
    # @key.stubs(:create_key).returns('01234')
    enigma = Enigma.new(@message)
    # expected = 'iuhsppsvsa !'
    refute_equal @message, enigma.encrypt
  end

  def test_it_can_decrypt_with_key_and_date
    message = 'iuhsppsvsa !'
    Date.stubs(:today).returns(Date.new(2020, 06, 06))
    enigma = Enigma.new(message, '01234', OffsetGenerator.new.date)
    expected = 'hello world!'
    assert_equal expected, enigma.decrypt
  end

  def test_it_can_decrypt_without_key_and_date
    skip
  end

  # def test_it_can_format_date
  #   Date.stubs(:today).returns(Date.new(2020, 06, 06))
  #   enigma = Enigma.new(@message, 01234)
  #   assert_equal '06062020', enigma.date
  # end

  # def test_it_can_make_offset
  #   Date.stubs(:today).returns(Date.new(2020, 06, 06))
  #   enigma = Enigma.new(@message)
  #   expected = "0400"
  #   assert_equal expected, enigma.create_offset
  # end


  # def test_it_can_make_offset_hash
  #   Date.stubs(:today).returns(Date.new(2020, 06, 06))
  #   enigma = Enigma.new(@message)
  #   expected = {:A => "0",
  #   :B => "4",
  #   :C => "0",
  #   :D => "0"
  #   }
  #
  #   assert_equal expected, enigma.offset_hash
  # end

  # def test_it_can_make_shift_hash_without_key_and_date
  #   Date.stubs(:today).returns(Date.new(2020, 06, 06))
  #   Enigma.stubs(:rand).returns(1234)
  #   enigma = Enigma.new(@message)
  #   expected = {:A => 1,
  #   :B => 16,
  #   :C => 23,
  #   :D => 34
  #   }
  #   assert_equal expected, enigma.create_shift
  # end

  # def test_it_can_make_shift_hash_with_key_and_date
  #   enigma = Enigma.new(@message, "02715", "040895")
  #   expected = {:A => 3,
  #   :B => 27,
  #   :C => 73,
  #   :D => 20
  #   }
  #   assert_equal expected, enigma.create_shift
  # end

end
