require 'erb'

class BuildModel
  def initialize(matricula)
    time = Time.now.strftime('%d%m%Y')
    @matricula_num = matricula
    @filename = "saved/#{matricula}-#{time}.docx"
    File.new(@filename, 'w+')
    File.new('temp.txt', 'w+')
  end

  def titulo(type, area, city_state)
    @prop_type = type
    @area = area
    @city_state = city_state
    @title = "#{type} de #{area}m², em #{city_state}"
  end

  def comercial_description(street, neighbourhood, number, apt_info = '', condo = '')
    @street = street
    @neighbourhood = neighbourhood
    @number = number
    @apt_info = apt_info
    @condo = condo

    commercial_template = ERB.new File.read('templates/commercial_description.erb')
    @commercial_result = commercial_template.result(binding)
  end

  def nearby_description(description)
    @nearby_description = description
  end

  def residence_features(features)
    @residence_features = features
  end

  def condo_features(features)
    @condo_features = features
  end

  def matricula(description)
    num = @matricula_num.size > 3 ? @matricula_num.insert(-4, '.') : @matricula_num
    @matricula = "Matrícula nº #{num} do #{description}"
  end

  def build_file
    File.open(@filename, 'a') do |f|
      f.puts "Titulo:\n#{@title}"
      f.puts "\n----------------\nDescrição comercial:\n#{@commercial_result}"
      f.puts "\n#{@nearby_description}\n\nO #{@prop_type} possui:" if @residence_features
      @residence_features.each { |feat| f.puts "  - #{feat}" } if @residence_features
      f.puts "\nO condomínio conta com os seguintes recursos:" if @condo_features
      @condo_features.each { |feat| f.puts "  - #{feat}" } if @condo_features
      f.puts "\n#{@matricula}\n\n"
    end
    description_in_matricula
    final_part
  end

  private

  def description_in_matricula
    load
    save
    File.delete('temp.txt')
  end

  def final_part
    File.open(@filename, 'a') { |f| f.puts File.read('templates/final_part.txt') }
  end

  def load
    @lines = []
    File.readlines('temp.txt').each do |line|
      @lines << line.chomp
    end
    @lines
  end

  def save
    File.open(@filename, 'a') do |file|
      @lines.each do |line|
        file.print line.concat(' ')
      end
      file.puts "\n"
    end
  end
end
