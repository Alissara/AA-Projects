class Knight < Piece
  include SteppingPiece

  def symbol
    'k'.colorize(color)
  end

  def move_dirs
  end

end
