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
end
