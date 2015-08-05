require_relative 'test_helper'
require 'enigma/crack/cracker'

class CrackerTest < Minitest::Test

  def setup
    @cipher = Cipher.new.cipher
  end

  def test_find_last_four_characters
    input = Cracker.new
    assert_equal "nd..", input.take_last_four_characters("hello..end..")
  end

  def test_split_phrase_into_array
    input = Cracker.new
    expected = [".", ".", "e", "n", "d", ".", "."]
    assert_equal expected, input.split_phrase("..end..")
  end

  def test_find_the_correct_index_of_each_character
    input = Cracker.new
    expected = [26, 36, 2, 2]
    assert_equal expected, input.crack_letter("aaaa")
  end

  def test_finds_the_correct_distance_between_characters
    input = Cracker.new
    assert_equal 2 , input.find_distance("a",".")
  end

  def test_find_encrypted_length
    input = Cracker.new
    assert_equal [0, 1, 2, 3], input.find_encrypted_length("aaaa")
  end

  def test_puts_final_rotation_in_correct_order
     input = Cracker.new
    assert_equal [26, 36, 2, 2], input.put_in_order("aaaa")
  end
end