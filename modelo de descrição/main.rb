require_relative 'lib/build_file'

TYPES_OF_PROPERTIES = %w[Imóvel Apartamento Terreno].freeze
CONDO_FEATURES = ['Portaria 24 horas', 'Sauna', 'Salão de Festas', 'Churrasqueira', 'Academia', 
  'Piscina', 'Quadra Poliesportiva', 'Brinquedoteca', 'Bicicletário', 'Playground'].freeze

model = BuildModel.new(1234)

# Criating a title
puts 'Qual tipo de popriedade?'
TYPES_OF_PROPERTIES.each_with_index { |type, idx| puts "#{idx}: #{type}" }
type_num = gets.chomp.to_i
type = TYPES_OF_PROPERTIES[type_num]

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

if type_num == 1
  puts "\nInformações sobre o apartamento, caso aplicavel (ex. 'unidade 167, do tipo II, localizado no 16º andar')"
  apt_info = gets.chomp

  puts "\nNome de condominio (ex. 'Edifício Residencial Vergueiro')"
  condo = gets.chomp
  puts "\n----------------\nDescrição comercial:"
  model.comercial_description(street, neighbourhood, number, apt_info, condo)
else
  puts "\n----------------\nDescrição comercial:"
  model.comercial_description(street, neighbourhood, number)
end

# Nearby places description
puts "\nInserir Descrição das proximidades da propriedade. Exemplo:"
puts File.read('templates/proximidades.txt')
puts "\n"
nearby_places = gets.chomp

model.nearby_description(nearby_places)

# Details of the residence
if type_num != 2
  puts "\nInsira todos os detalhes das acomodações ('end' para finalizar). Exemplos:"
  puts "Sala de estar [Com duplo ambiente e varanda]
  Cozinha
  1 Sanitário Social
  2 Dormitórios
  Área de Serviço
  1 Vaga de Garagem Coberta e Indeterminada\n"

  feature = ''
  features = []
  while feature != 'end'
    feature = gets.chomp
    features << feature
  end
  features.delete('end')
  unless features.empty?
    model.residence_features(features)
  end
end

# Condominium features for apartments
if type_num == 1
  puts "\nInformações do condominio. Opções:"
  CONDO_FEATURES.each_with_index do |feat, idx|
    puts "#{idx}- #{feat}"
  end

  condo_feat = []
  chosen = gets.chomp.split
  unless chosen.empty?
    chosen.each { |num| condo_feat << CONDO_FEATURES[num.to_i] }
    model.condo_features(condo_feat)
  end
end

# Registration information
puts "\nInsira as informações da matricula (ex. Matrícula nº 1.525 do CRI da Comarca de Tremembé/SP.)"
registration = gets.chomp
model.matricula(registration)

# Description form matricula
puts "\nInsira a descrição da matricula no arquivo, e depois de salvar pressione enter."
system 'gedit temp.txt'
gets.chomp
model.description_in_matricula
