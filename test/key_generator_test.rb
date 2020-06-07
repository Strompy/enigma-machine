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
end
