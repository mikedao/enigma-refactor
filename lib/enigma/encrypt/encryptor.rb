require './lib/enigma/encrypt/key_generator'
require './lib/enigma/encrypt/offset'
require './lib/enigma/encrypt/cipher'

class Encryptor

  attr_accessor :date, :offset, :key

  def initialize
    date_array = CurrentDate.new.takes_last_four_digits
    @offset = Offset.new(date_array).split_time(date_array)
    @valid_key = KeyGenerator.new
    @cipher = Cipher.new.cipher
  end

  def key
    @valid_key.key_for_display_prompt
  end

  def generates_file_rotation_value
    final_rotation_values = @offset.zip(@valid_key.find_array_rotation)
    final_rotation_values.map do |element|
      element.reduce(:+)
    end
  end

  def encrypt_letter(phrase)
    stripped_phrase = phrase.gsub(/[!@#$%^&*)]/,"").downcase

    phrase = stripped_phrase.scan(/.{1,4}/)
    phrase = phrase.map do |phrase|
      phrase = phrase.split("")
      phrase.map.with_index do |k,index|
        if index == 0
            cipher_for_rotation = creates_rotation_hash(generates_file_rotation_value[0])
            cipher_for_rotation[k]
        elsif index == 1
            cipher_for_rotation = creates_rotation_hash(generates_file_rotation_value[1])
            cipher_for_rotation[k]
        elsif index == 2
            cipher_for_rotation = creates_rotation_hash(generates_file_rotation_value[2])
            cipher_for_rotation[k]
        else
            cipher_for_rotation = creates_rotation_hash(generates_file_rotation_value[3])
            cipher_for_rotation[k]
        end
      end
    end
    phrase.join
  end

  def creates_rotation_hash(number_of_rotations)
    rotated_characters = @cipher.rotate(number_of_rotations)
    Hash[@cipher.zip(rotated_characters)]
  end
end



