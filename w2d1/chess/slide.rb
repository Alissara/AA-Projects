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
    move = []

    move_dirs.each do |dx, dy|
      move.concat(grow_unblocked_moves_in_dir(dx, dy))
    end

    move
  end

  def grow_unblocked_moves_in_dir(dx, dy)
    unblocked = []

    new_pos = [self.pos[0] + dx, self.pos[1] + dy]
    while board.in_bounds?(new_pos) && board[new_pos].empty?
      unblocked << new_pos
      new_pos = [new_pos[0] + dx, new_pos[1] + dy]
    end

    if board.in_bounds?(new_pos) &&
    board[new_pos].color != board[self.pos].color
      unblocked << new_pos
    end

    unblocked
  end

end
