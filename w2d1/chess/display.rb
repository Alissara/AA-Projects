require 'colorize'
require_relative 'cursor'
require_relative 'board'

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)

  end

  def render
    system("clear")
    build_grid.each { |row| puts row.join }
  end

  def build_grid
    @board.grid.map.with_index do |row, r|
      row.map.with_index do |piece, c|

        if [r, c] == @cursor.cursor_pos
          bg = { :background => :green }
        elsif (r + c).odd?
          bg = { :background => :light_blue }
        end

        piece.to_s.colorize(bg)
      end
    end
  end


  def move(new_pos)

  end



end





if __FILE__ == $PROGRAM_NAME
  b = Board.new
  d = Display.new(b)
  while true
    d.render
    d.cursor.get_input
  end
end
