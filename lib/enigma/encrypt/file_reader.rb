class FileReader

  def initialize(filename = "test.txt")
    @filename = filename
  end

  def file_reader
    file_input = File.open(@filename,'r')
    data = file_input.read
    file_input.close
    data
  end
end





