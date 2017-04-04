class King < Piece
  include SteppingPiece

  def symbol
    'K'.colorize(color)
  end

  def move_dirs
  end

end
