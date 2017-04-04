module SlidingPiece


  def horizontal_dirs
    [[0, -1], [0, 1], [-1, 0], [1, 0]]
  end

  def diagonal_dirs
    [[-1, -1], [-1, 1], [1, 1], [-1, 1]]
  end


  def move_dirs
    #subclass
  end

  def moves
  end

  def grow_unblocked_moves_in_dir(dx, dy)
  end



end
