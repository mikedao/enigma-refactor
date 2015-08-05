class FileWriter

  def initialize(message = "hello jeff", file = "testwrite.txt")
    @message = message
    @file = file
  end

  def file_writer
    file_output = File.open(@file, 'w')
    file_output.write(@message)
    file_output.close
  end
end

