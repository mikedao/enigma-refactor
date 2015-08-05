require './lib/enigma/encrypt/file_reader'
require './lib/enigma/encrypt/encryptor'
require './lib/enigma/encrypt/key_generator'
require './lib/enigma/encrypt/file_writer'

input = ARGV[0] || "message.txt"
input_1 = ARGV[1] || "encrypted.txt"

class Runner
  def initialize(input, input_1)
    message = FileReader.new(input).file_reader
    message_encrypt = Encryptor.new
    message_to_be_encrypted = message_encrypt.encrypt_letter(message)
    key = message_encrypt.key
    current_date = CurrentDate.new.current_date
    FileWriter.new(message_to_be_encrypted, input_1).file_writer
    puts "Created #{input_1} with the key #{key} and date #{current_date}"
  end
end

Runner.new(input, input_1)








