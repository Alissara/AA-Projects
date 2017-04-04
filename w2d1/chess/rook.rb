class Rook < Piece
  include SlidingPiece

  def symbol
    'R'.colorize(color)
  end

  def move_dirs
  end

end
