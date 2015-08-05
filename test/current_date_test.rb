require_relative 'test_helper'
require 'enigma/encrypt/current_date'

class CurrentDateTest < Minitest::Test

  def test_gives_a_date_in_the_correct_format
    input = CurrentDate.new
    assert_equal 6, Date.today.strftime('%d%m%y').length
  end

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

