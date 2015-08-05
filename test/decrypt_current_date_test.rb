require_relative 'test_helper'
require 'enigma/decrypt/decrypt_current_date'

class DecryptCurrentDateTest < Minitest::Test

  def test_squares_the_date
    input = CurrentDate.new
    input.current_date = "270715"
    assert_equal "73286611225" , input.squares_the_date
  end

  def test_takes_the_last_four_digits_of_the_squared_date
    input = CurrentDate.new
    input.current_date = "270715"
    assert_equal "1225" , input.takes_last_four_digits
  end

  def test_output_is_a_string
    input = CurrentDate.new
    input.current_date = "270715"
    assert input.takes_last_four_digits.class == String
  end
end

