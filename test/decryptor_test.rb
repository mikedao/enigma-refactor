require_relative 'test_helper'
require 'enigma/decrypt/decryptor'

class DecryptorTest < Minitest::Test

  def setup
    @input = Decryptor.new("82648", "280715")
    @time = DecryptCurrentDate.new("280715").takes_last_four_digits
    @offset = Offset.new(time).split_time(time)
    @valid_key = DecryptKeyGenerator.new("82648")
    @cipher = Cipher.new.cipher
  end

  def test_final_rotation_is_length_is_correct
    assert_equal 4, @input.generates_file_rotation_value.count
  end

  def test_final_rotations_are_fixnums
    assert_equal Fixnum, @input.generates_file_rotation_value[0].class
  end

  def test_offset_values_and_valid_key_values_are_zipped_into_an_array
    assert_equal [[1, 82], [2, 26], [2, 64], [5, 48]], @offset.zip(@valid_key.find_array_rotation)
  end

  def test_final_rotation_is_correct
    assert_equal [83, 28, 66, 53] , @input.generates_file_rotation_value
  end

  def test_encrypted_phrase_matches_the_input_phrase_length
    assert_equal 5, @input.decrypt_letter("Hello").length
  end

  def test_long_phrase_is_encrypted_correctly
    results = []
    100.times do
      @input.decrypt_letter("hello world")
      results << @input
    end
    assert_equal 1, results.uniq.count
  end

  def test_one_word_is_encrytped_correctly
    results = []
    100.times do
      @input.decrypt_letter("hello")
      results << @input
    end
    assert_equal 1, results.uniq.count
  end

  def test_one_letter_is_encrypted_correctly
    results = []
    100.times do
      @input.decrypt_letter("h")
      results << @input
    end
    assert_equal 1, results.uniq.count
  end

  def test_can_take_an_empty_phrase
    assert_equal "", @input.decrypt_letter("")
  end

  def test_creates_the_correct_rotation_hash_length
    assert_equal 39, @input.creates_rotation_hash(1).length
  end

  def test_number_of_rotations_are_negative
    assert_equal false, @input.generates_file_rotation_value[0] < 0
    assert_equal false, @input.generates_file_rotation_value[1] < 0
    assert_equal false, @input.generates_file_rotation_value[2] < 0
    assert_equal false, @input.generates_file_rotation_value[3] < 0
  end

  def test_creates_the_correct_rotation_hash
    hash = @input.creates_rotation_hash(1)
    assert_equal hash["a"], "b"
    assert_equal hash[","], "a"
  end
end


