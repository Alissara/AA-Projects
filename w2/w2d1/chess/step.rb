module SteppingPiece

  def move_diffs
    #subclass
  end

  def moves
    move = []

    move_diffs.each do |dx, dy|
      new_pos = [self.pos[0] + dx, self.pos[1] + dy]

      if board.in_bounds?(new_pos) && board[new_pos].empty?
        move << new_pos
      elsif board.in_bounds?(new_pos) &&
      board[new_pos].color != board[self.pos].color
        move << new_pos
      end

    end

    move
  end


end
