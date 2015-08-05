require './lib/enigma/encrypt/file_reader'
require './lib/enigma/decrypt/decryptor'
require './lib/enigma/decrypt/decrypt_file_writer'

input = ARGV[0] || "encrypted.txt"
input_1 = ARGV[1] || "decrypted.txt"
input_2 = ARGV[2] || "82648"
input_3 = ARGV[3] || "280715"

class DecryptRunner
  def initialize(input, input_1, input_2, input_3)
    message = FileReader.new(input).file_reader
    message_decrypt = Decryptor.new(input_2, input_3)
    message_to_be_decrypted = message_decrypt.decrypt_letter(message)
    FileWriter.new(message_to_be_decrypted, input_1).file_writer
    puts "Created #{input_1} with the key #{input_2} and date #{input_3}"
  end
end

DecryptRunner.new(input, input_1, input_2, input_3)

