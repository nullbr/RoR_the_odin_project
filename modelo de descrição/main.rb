require_relative 'lib/build_file'

TYPES_OF_PROPERTIES = ['Imóvel', 'Apartamento', 'Terreno']

model = BuildModel.new(1234)

# Criating a title
puts "Qual tipo de popriedade?"
TYPES_OF_PROPERTIES.each_with_index { |type, idx| puts "#{idx}: #{type}" }
type = TYPES_OF_PROPERTIES[gets.chomp.to_i]

puts "\nQual a area util (somente numeros)"
area = gets.chomp.to_i

puts "\nQual a localização? ex. São Paulo/SP"
location = gets.chomp

puts "\n----------------\nTitulo:"
model.titulo(type, area, location)

# Criating a commertial description
puts "\nQual a rua?"
street = gets.chomp

puts "\nQual o numero?"
number = gets.chomp

puts "\nQual o bairro?"
neighbourhood = gets.chomp

if type == 'Apartamento'
    puts "\nInformações sobre o apartamento, caso aplicavel (ex. 'unidade 167, do tipo II, localizado no 16º andar')"
    apt_info = gets.chomp

    puts "\nNome de condominio (ex. 'Edifício Residencial Vergueiro')"
    condo = gets.chomp
end

puts "\n----------------\nDescrição comercial:"
model.comercial_description(street, neighbourhood, number, apt_info = '', condo = '')

# Nearby places description
puts "\nInserir Descrição das proximidades da propriedade. Exemplo:"
puts File.read('templates/proximidades.txt')
puts "\n"
nearby_places = gets.chomp

model.nearby_description(nearby_places)
