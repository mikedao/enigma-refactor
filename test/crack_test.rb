# require 'enigma/crack/crack'

# class CrackTest < Minitest::Test

#   def setup
#     @cipher = Cipher.new.cipher
#     @input = CrackRunner.new("encrypted.txt", "cracked.txt", "290715")
#   end

#   def test_encrypted_phrase_matches_the_input_phrase_length
#     assert_equal 5, @input.decrypt_letter("Hello").length
#   end

#   def test_long_phrase_is_cracked_correctly
#     results = []
#     100.times do
#       @input.decrypt_letter("hello world")
#       results << @input
#     end
#     assert_equal 1, results.uniq.count
#   end

#   def test_can_take_an_empty_phrase
#     assert_equal "", @input.decrypt_letter("")
#   end

#   def test_creates_the_correct_rotation_hash_length
#     assert_equal 39, @input.creates_rotation_hash(1).length
#   end

#   def test_creates_the_correct_rotation_hash
#     hash = @input.creates_rotation_hash(1)
#     assert_equal hash["a"], "b"
#     assert_equal hash[","], "a"
#   end
# end
