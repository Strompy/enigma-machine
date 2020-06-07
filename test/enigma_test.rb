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
    expected = {encryption: 'iuhsppsvsa !',
      key: '01234',
      date: '06062020'
    }
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
    enigma = Enigma.new(@message)
    refute_equal @message, enigma.encrypt[:encryption]
  end

  def test_it_can_decrypt_with_key_and_date
    message = 'iuhsppsvsa !'
    Date.stubs(:today).returns(Date.new(2020, 06, 06))
    enigma = Enigma.new(message, '01234', OffsetGenerator.new.date)
    expected = {decryption: 'hello world!',
      key: '01234',
      date: '06062020'
    }
    assert_equal expected, enigma.decrypt
  end

  def test_it_can_decrypt_without_date
    message = 'iuhsppsvsa !'
    Date.stubs(:today).returns(Date.new(2020, 06, 06))
    enigma = Enigma.new(message, '01234')
    expected = {decryption: 'hello world!',
      key: '01234',
      date: '06062020'
    }
    assert_equal expected[:decryption], enigma.decrypt[:decryption]
    assert_equal expected[:date], enigma.decrypt[:date]
  end

end
