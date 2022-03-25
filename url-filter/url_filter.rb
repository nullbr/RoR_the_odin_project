def load(from_file)
  @non_commented = []
  File.readlines(from_file).each do |line|
    @non_commented << line.split if line[0] != '#'
  end
  @non_commented
end

def save(to_file = 'current_cron_active.csv')
  File.open(to_file, 'w') do |file|
    @all_urls.sort.each do |url|
      file.puts url
    end
  end
end

def filtro_de_url
  @all_urls = []
  @non_commented.each do |line|
    url = line.select { |string| string[0..7] == 'https://' }
    @all_urls << url
  end
end

file = File.join('cron.csv')

load(file)
filtro_de_url
save
