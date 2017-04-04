class Queen < Piece
  include SlidingPiece

  def symbol
    'Q'.colorize(color)
  end

  def move_dirs
  end

end
