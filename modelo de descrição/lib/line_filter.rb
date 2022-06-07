def load
  @lines = []
  File.readlines('temp.txt').each do |line|
    @lines << line.chomp
  end
  @lines
end

def save(filename)
  File.open(filename, 'a') do |file|
    @lines.each do |line|
      file.print line.concat(' ')
    end
  end
end
