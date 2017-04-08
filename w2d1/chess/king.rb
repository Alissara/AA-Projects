require_relative 'piece'
require_relative 'step'

class King < Piece
  include SteppingPiece

  def symbol
    'K'.colorize(color)
  end

  def move_diffs
    [[-1, -1],
      [-1, 0],
      [-1, 1],
      [0, -1],
      [0, 1],
      [1, -1],
      [1, 0],
      [1, 1]]
  end

end
