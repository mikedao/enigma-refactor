require './lib/enigma/encrypt/cipher'

class Cracker
  def initialize
    @cipher = Cipher.new.cipher
    @results = []
    @amt = []
  end

  def take_last_four_characters(phrase)
    phrase[-4..-1]
  end

  def split_phrase(phrase)
    phrase.split("")
  end

  def crack_letter(phrase)
    last_four_chars = take_last_four_characters(phrase)
    split_last_four = split_phrase(last_four_chars)
    known_chars = "nd.."
    character_rotation = split_last_four.map.with_index do |encrypted_char, index|
      known_char = known_chars[index]
      find_distance(encrypted_char, known_char)
    end
  end

  def find_distance(encrypted_char, known_char)
    characters = @cipher
    start = characters.index(known_char)
    counter = 0
    until characters[start] == encrypted_char
      characters = characters.rotate
      counter += 1
    end
      counter
  end

  def find_encrypted_length(phrase)
    number = phrase.length
    @results << (number - 4) % 4
    @results << (number - 3) % 4
    @results << (number - 2) % 4
    @results << (number - 1) % 4

  end

  def put_in_order(phrase)
    order = Hash[find_encrypted_length(phrase).zip(crack_letter(phrase))]
    order.map.with_index do |x, index|
        order[index]
    end
    a = order.sort
    c = a.flatten
    c.select.each_with_index { |str, i| i.odd? }
  end
end




