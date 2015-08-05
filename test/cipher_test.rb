require_relative 'test_helper'
require 'enigma/encrypt/cipher'


class CipherTest < Minitest::Test
  def test_gives_back_correct_character_map
    input = Cipher.new
    assert_equal ["a","b","c","d"], input.cipher[0..3]
  end

  def test_does_not_have_unexpected_characters
    input = Cipher.new
    refute_equal ["!","@","#","$","%","^"], input.cipher
  end

  def test_the_character_map_is_the_correct_lenght
    input = Cipher.new
    assert_equal 39, input.cipher.count
  end

  def test_the_character_map_contains_no_upper_case_letters
    input = Cipher.new
    refute_equal ["A","B","C"], input.cipher
  end

  def test_the_characters_are_in_an_array
    input = Cipher.new
    assert Array input.class
  end

  def test_the_first_characters_is_a
    input = Cipher.new
    assert_equal "a", input.cipher[0]
  end

  def test_the_first_characters_is_a
    input = Cipher.new
    assert_equal ",", input.cipher[-1]
  end
end
