def processInput(input, line_n)
  if line_n == 0
    @v = input.to_i
  elsif line_n == 1
    @f = input.split(' ')
  elsif line_n == 2
    @c = input.to_i
    @f = @f.map { |item| item.to_i }.rotate(@c)
  else
    @x = input.to_i
    @c_for_x = nil
    @f.each_with_index { |v, idx| @c_for_x = idx if v == @x }
  end
end

def output
  puts @f[0]
  p @c_for_x
end

# Este e um exemplo de processamento de entradas (inputs), sinta-se a vontade para altera-lo conforme necessidade da questao.

count_line = 0
ARGF.each_line.map do |line|
  processInput(line.strip, count_line)
  count_line += 1
  break if count_line > 3
end

output
