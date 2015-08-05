require_relative 'test_helper'
require 'enigma/encrypt/file_reader'
require 'enigma/encrypt/file_writer'

class FileWriterTest < Minitest::Test

  def test_opens_and_writes_the_correct_contents_to_a_file
      file = FileWriter.new("hello jeff", "testwrite.txt").file_writer
      read = FileReader.new("testwrite.txt")
      assert_equal "hello jeff", read.file_reader
  end
end
