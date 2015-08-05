require './lib/enigma/encrypt/cipher'
require './lib/enigma/decrypt/decrypt_key_generator'
require './lib/enigma/encrypt/offset'

class Decryptor

  def initialize(key, date)
    time = DecryptCurrentDate.new(date).takes_last_four_digits
    @offset = Offset.new(time).split_time(time)
    @valid_key = DecryptKeyGenerator.new(key)
    @cipher = Cipher.new.cipher
  end

  def generates_file_rotation_value
    final_rotation_values = @offset.zip(@valid_key.find_array_rotation)
    final_rotation_values.map do |element|
      element.reduce(:+)
    end
  end

def decrypt_letter(phrase)
    downcase = phrase.downcase
    phrase = downcase.scan(/.{1,4}/)

    phrase = phrase.map do |phrase|
      phrase = phrase.split("")
      phrase.map.with_index do |k,index|
        if index == 0
            cipher_for_rotation = creates_rotation_hash(generates_file_rotation_value[0] * -1)
            cipher_for_rotation[k]
        elsif index == 1
            cipher_for_rotation = creates_rotation_hash(generates_file_rotation_value[1] * -1)
            cipher_for_rotation[k]
        elsif index == 2
            cipher_for_rotation = creates_rotation_hash(generates_file_rotation_value[2] * -1)
            cipher_for_rotation[k]
        else
            cipher_for_rotation = creates_rotation_hash(generates_file_rotation_value[3] * -1)
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


