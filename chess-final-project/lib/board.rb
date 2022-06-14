require 'colorize'
# Chess board with colorize gem

class Board
  def initialize
    @grid = []
    8.times { @grid << [nil, nil, nil, nil, nil, nil, nil, nil] }
  end

  def to_s
    8.times do |row|
      8.times do |column|
        block = @grid[row][column].nil? ? "   " : " #{@grid[row][column]} "
        if row.even?
          print column.even? ? block.black.on_light_white : block.white.on_light_black
        else
          print column.odd? ? block.black.on_light_white : block.white.on_light_black
        end
      end
      print "\n"
    end
  end
end
