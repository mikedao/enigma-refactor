require_relative 'test_helper'
require 'enigma/encrypt/key_generator'

class KeyGeneratorTest < Minitest::Test

  def test_key_is_five_digits_long
    input = KeyGenerator.new
    assert_equal 5, input.random_key.count
  end

  def test_key_is_random
    results = []
    100.times do
      input = KeyGenerator.new
      results << input
    end
    assert_equal 100, results.uniq.count
  end

  def test_key_for_display_prompt_is_a_string
    input = KeyGenerator.new
    assert String input.key_for_display_prompt.class == String
  end

  def test_find_rotation_a
    input = KeyGenerator.new
    input.random_key = "12345"
    assert_equal "12" , input.find_rotation_a
  end

  def test_find_rotation_b
    input = KeyGenerator.new
    input.random_key = "12345"
    assert_equal "23" , input.find_rotation_b
  end

  def test_find_rotation_c
    input = KeyGenerator.new
    input.random_key = "12345"
    assert_equal "34" , input.find_rotation_c
  end

  def test_find_rotation_d
    input = KeyGenerator.new
    input.random_key = "12345"
    assert_equal "45" , input.find_rotation_d
  end

  def test_final_rotation_has_four_elements
    input = KeyGenerator.new
    input.find_array_rotation
    assert_equal 4 , input.find_array_rotation.count
  end

  def test_final_array_rotation_element_is_two_digits
    input = KeyGenerator.new
    input.find_array_rotation
    assert_equal 2 , input.find_array_rotation[0].to_s.length
  end

  def test_each_element_in_final_rotation_is_a_fixnum
    input = KeyGenerator.new
    input.find_array_rotation
    assert_equal Fixnum, input.find_array_rotation[0].class
  end
end

