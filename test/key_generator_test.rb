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
    assert_equal '', key_gen.key
    assert_equal expected, key_gen.key_hash
  end

  def test_it_can_create_key
    key_gen = KeyGenerator.new
    key_gen.stubs(:rand).returns(1234)
    expected_key = "01234"
    key_gen.create_key
    assert_equal 5, key_gen.key.length
    assert_equal expected_key, key_gen.key
  end

  def test_it_can_make_key_hash
    key_gen = KeyGenerator.new
    key_gen.stubs(:rand).returns(1234)
    key_gen.create_key
    key_gen.create_key_hash
    expected = {:A => "01",
    :B => "12",
    :C => "23",
    :D => "34"
    }

    assert_equal expected, key_gen.key_hash
  end

end
