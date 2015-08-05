require_relative 'test_helper'
require 'enigma/encrypt/offset'

class OffsetTest < Minitest::Test

  def test_takes_key_and_puts_it_into_an_array
    input = Offset.new("1225")
    assert input.split_time("1225").class == Array
  end

  def test_that_the_offset_length_is_four
    input = Offset.new("1225")
    assert_equal 4, input.split_time("1225").length
  end

  def test_that_the_numbers_are_fixnums
    input = Offset.new("1225")
    numbers = input.split_time("1225")
    assert numbers[0], numbers.class == Fixnum
  end
end

