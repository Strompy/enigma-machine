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
end
