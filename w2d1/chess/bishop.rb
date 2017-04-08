require_relative 'piece'
require_relative 'slide'

class Bishop < Piece
  include SlidingPiece

  def symbol
    'B'.colorize(color)
  end

  def move_dirs
    diagonal_dirs
  end


end
