require 'erb'

class BuildModel
    def titulo(type, area, city_state)
        @prop_type = type
        @area = area
        @city_state = city_state
        puts @titulo = "#{type} de #{area}m², em #{city_state}"
    end

    def comercial_description(street, neighbourhood, number, apt_info = '', condo = '')
        @street = street
        @neighbourhood = neighbourhood
        @number = number
        @apt_info = apt_info
        @condo = condo
        
        commercial_template = ERB.new File.read('templates/commercial_description.erb')
        puts commercial_template.result(binding)
        
    end
end