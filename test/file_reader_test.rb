require_relative 'test_helper'
require 'enigma/encrypt/file_reader'

class FileReaderTest < Minitest::Test

def test_opens_and_reads_the_correct_contents_of_a_file
    read = FileReader.new
    assert_equal "hello jeff", read.file_reader
  end
end
