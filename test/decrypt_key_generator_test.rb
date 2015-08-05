require_relative 'test_helper'
require 'enigma/decrypt/decrypt_key_generator'

class DecryptKeyGeneratorTest < Minitest::Test

  def test_random_key_in_array
    input = DecryptKeyGenerator.new("12345")
    expected = ["1", "2", "3", "4", "5"]
    assert_equal expected, input.random_key
  end

  def test_array_rotation_is_array
    input = DecryptKeyGenerator.new("12345")
    assert_equal Array, input.find_array_rotation.class
  end

  def test_find_rotation_a
    input = DecryptKeyGenerator.new("12345")
    assert_equal ["1", "2"] , input.find_rotation_a
  end

  def test_find_rotation_b
    input = DecryptKeyGenerator.new("12345")
    assert_equal ["2", "3"] , input.find_rotation_b
  end

  def test_find_rotation_c
    input = DecryptKeyGenerator.new("12345")
    assert_equal ["3", "4"] , input.find_rotation_c
  end

  def test_find_rotation_d
    input = DecryptKeyGenerator.new("12345")
    assert_equal ["4", "5"] , input.find_rotation_d
  end

  def test_final_rotation_has_four_elements
    input = DecryptKeyGenerator.new("12345")
    input.find_array_rotation
    assert_equal 4 , input.find_array_rotation.count
  end

  def test_final_array_rotation_element_is_two_digits
    input = DecryptKeyGenerator.new("12345")
    input.find_array_rotation
    assert_equal 2 , input.find_array_rotation[0].to_s.length
  end

  def test_each_element_in_final_rotation_is_a_fixnum
    input = DecryptKeyGenerator.new("12345")
    input.find_array_rotation
    assert_equal Fixnum, input.find_array_rotation[0].class
  end

end

