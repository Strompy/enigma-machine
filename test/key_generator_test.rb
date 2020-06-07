require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key_generator'
require 'mocha/minitest'

class KeyGeneratorTest < Minitest::Test

  def test_it_exists
    key_gen = KeyGenerator.new
    assert_instance_of KeyGenerator, key_gen
  end

  def test_it_has_attributes
    key_gen = KeyGenerator.new
    expected = {}
    assert_equal expected, key_gen.key
    assert_equal expected, key_gen.key_hash
  end

  def test_it_can_create_key
    KeyGenerator.stubs(:rand).returns(1234)
    enigma = KeyGenerator.new
    expected_key = "01234"
    assert_equal 5, enigma.key.length
    assert_equal expected_key, enigma.key
  end

  def test_it_can_make_key_hash
    KeyGenerator.stubs(:rand).returns(1234)
    enigma = KeyGenerator.new
    expected = {:A => "01",
    :B => "12",
    :C => "23",
    :D => "34"
    }

    assert_equal expected, enigma.key_hash
  end

end
