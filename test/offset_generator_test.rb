require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset_generator'
require 'mocha/minitest'

class OffsetGeneratorTest < Minitest::Test

  def test_it_exists
    offset = OffsetGenerator.new
    assert_instance_of OffsetGenerator, offset
  end

  def test_it_can_format_date
    Date.stubs(:today).returns(Date.new(2020, 06, 06))
    offset = OffsetGenerator.new
    assert_equal '06062020', offset.generate_date
  end

  def test_it_can_make_offset
    Date.stubs(:today).returns(Date.new(2020, 06, 06))
    offset = OffsetGenerator.new
    expected = "0400"
    assert_equal expected, offset.create_offset
  end

  def test_it_can_make_offset_hash
    Date.stubs(:today).returns(Date.new(2020, 06, 06))
    enigma = Enigma.new(@message)
    expected = {:A => "0",
    :B => "4",
    :C => "0",
    :D => "0"
    }

    assert_equal expected, enigma.offset_hash
  end

end
