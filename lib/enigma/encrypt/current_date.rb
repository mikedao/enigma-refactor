require 'date'
require './lib/enigma/encrypt/offset'

class CurrentDate

  attr_accessor :current_date

  def initialize
    @current_date = Date.today.strftime('%d%m%y')
  end

  def squares_the_date
    (@current_date.to_i ** 2).to_s
  end

  def takes_last_four_digits
    squares_the_date.chars[-4..-1].join
  end
end


