require_relative 'piece'
require_relative 'slide'

class Queen < Piece
  include SlidingPiece

  def symbol
    'Q'.colorize(color)
  end

  def move_dirs
    horizontal_dirs + diagonal_dirs
  end

end
