require 'pry'

def processInput(input, i)
  #Aqui é onde você deve desenvolver o seu algoritmo e processar a entrada e então retorna-la.

  if i == 1
    @clientes = input.to_i
    #p "clientes #{clients}"
  elsif i == 2
    qty = input.to_i
    @last_input = qty + 3
    #p "qty #{qty}"
  elsif i == @last_input
    @off_list = input.split
    #p "off_list #{@off_list}"
  else
    item = input.split
    @list[item[0]] = item[1] 
    #p "list #{@list}"
  end
end

def total_sum
  @sum = 0
  @list.each do |_key, value|
    @sum += value.to_i
  end

  return @sum
end

def div_comum
  @div = (@sum - off_list_sum) / @clientes.to_f
end

def off_list_sum
  @off_sum = 0
  @list.each do |key, value|
    @off_sum += value.to_i if @off_list.include?(key)
  end

  return @off_sum
end

#Este e um exemplo de processamento de entradas (inputs), sinta-se a vontade para altera-lo conforme necessidade da questao.
i = 1
@list = {}
@off_list = []

ARGF.each_line.map do |line|
  processInput(line, i)
  break if @last_input == i
  i += 1
end

puts "Total sum: #{total_sum}"
puts "Comom division: #{div_comum}"
puts "Off list sum: #{off_list_sum}"
