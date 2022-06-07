require 'erb'

class BuildModel
  def initialize(matricula)
    time = Time.now.strftime('%d%m%Y')
    @filename = "saved/#{matricula}-#{time}.docx"
    File.new(@filename, 'w+')
  end

  def titulo(type, area, city_state)
    @prop_type = type
    @area = area
    @city_state = city_state
    puts title = "#{type} de #{area}m², em #{city_state}"
    File.open(@filename, 'a') do |f|
      f.puts "Titulo:\n"
      f.puts title
    end
  end

  def comercial_description(street, neighbourhood, number, apt_info = '', condo = '')
    @street = street
    @neighbourhood = neighbourhood
    @number = number
    @apt_info = apt_info
    @condo = condo

    commercial_template = ERB.new File.read('templates/commercial_description.erb')
    puts result = commercial_template.result(binding)
    File.open(@filename, 'a') do |f|
      f.puts "\n----------------\nDescrição comercial:\n"
      f.puts result
    end
  end

  def nearby_description(description)
    File.open(@filename, 'a') do |f|
      f.puts "\n"
      f.puts description
    end
  end

  def residence_features(features)
    File.open(@filename, 'a') do |f|
      f.puts "\nO #{@prop_type} possui:"
      features.each do |feat|
        f.puts "  - #{feat}"
      end
    end
  end

  def condo_features(features)
    File.open(@filename, 'a') do |f|
      f.puts "\nO condomínio conta com os seguintes recursos:"
      features.each do |feat|
        f.puts "  - #{feat}"
      end
    end
  end
end
