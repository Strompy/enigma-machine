require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset_generator'
require './lib/key_generator'
require './lib/shift_generator'
require 'mocha/minitest'

class ShiftGeneratorTest < Minitest::Test

  def test_it_exists
    shift = ShiftGenerator.new
    assert_instance_of ShiftGenerator, shift
  end

  def test_it_can_make_shift_hash
    Date.stubs(:today).returns(Date.new(2020, 06, 06))
    ShiftGenerator.stubs(:rand).returns(1234)
    shift = ShiftGenerator.new
    shift.stubs(:rand).returns(1234)
    shift.create_key
    expected = {:A => 1,
    :B => 16,
    :C => 23,
    :D => 34
    }
    assert_equal expected, shift.create_shift
  end
end
