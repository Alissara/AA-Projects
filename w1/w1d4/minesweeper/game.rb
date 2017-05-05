require_relative "board"
# require_relative "tile"

class Game
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def play
    play_turn until lose?
  end

  def play_turn
    board.render
    print "Select position >"
    pos = parse_pos(gets.chomp)
    board[pos].reveal
    board.render
  end

  def parse_pos(str)
    str.split(',').map(&:to_i)
  end

  # def lose?
  #
  # end


end

game = Game.new
game.play_turn
