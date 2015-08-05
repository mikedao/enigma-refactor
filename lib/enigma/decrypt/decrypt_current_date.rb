require 'date'
require './lib/enigma/encrypt/offset'

class DecryptCurrentDate

  attr_accessor :provided_date

  def initialize(provided_date)
    @provided_date = provided_date
  end

  def squares_the_date
    (@provided_date.to_i ** 2).to_s
  end

  def takes_last_four_digits
    #This outputs a string of four numbers
    squares_the_date.chars[-4..-1].join
  end
end


