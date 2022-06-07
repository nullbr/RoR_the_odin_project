require 'erb'

class BuildModel
    def initialize(matricula)
        time = Time.now.strftime('%d%m%Y')
        @filename = "saved/#{matricula}-#{time}.docx"
        File.new(@filename, "w+")
    end

    def titulo(type, area, city_state)
        @prop_type = type
        @area = area
        @city_state = city_state
        puts title = "#{type} de #{area}m², em #{city_state}"
        open(@filename, 'a') do |f| 
            puts "Titulo:\n"
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
        open(@filename, 'a') do |f| 
            "\n----------------\nDescrição comercial:\n"
            f.puts result
        end
    end

    def nearby_description(description)
        open(@filename, 'a') do |f| 
            "\n----------------\nDescrição comercial:\n"
            f.puts description
        end
    end
end