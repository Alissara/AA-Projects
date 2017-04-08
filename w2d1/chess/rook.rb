require_relative 'piece'
require_relative 'slide'

class Rook < Piece
  include SlidingPiece

  def symbol
    'R'.colorize(color)
  end

  def move_dirs
    horizontal_dirs
  end

end
