require_relative 'piece'
require_relative 'sliding'

class Bishop < Piece
  include SlidingPiece

  def symbol
    'B'.colorize(color)
  end

  def move_dirs
  end


end
