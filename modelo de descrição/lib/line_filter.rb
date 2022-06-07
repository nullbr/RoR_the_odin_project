def load(from_file)
  @lines = []
  File.readlines(from_file).each do |line|
    @lines << line.chomp
  end
  @lines
end

def save(to_file = 'filtered-file.txt')
  File.open(to_file, 'w') do |file|
    @lines.each do |line|
      file.print line.concat(' ')
    end
  end
end

file = File.join('file.txt')

load(file)
save
