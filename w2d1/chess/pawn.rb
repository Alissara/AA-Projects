require_relative 'piece'

class Pawn < Piece

  def symbol
    'P'.colorize(color)
  end

  def moves
    forward_steps + side_attacks
  end

  def at_start_row?
    (self.color == :red && self.pos[0] == 1) ||
    (self.color == :black && self.pos[0] == 6)
  end

  def forward_steps
    steps = []

    case self.color
    when :red
      new_pos = [self.pos[0] + 1, self.pos[1]]
      if board.in_bounds?(new_pos) && board[new_pos].empty?
        steps << new_pos
        steps << [self.pos[0] + 2, self.pos[1]] if at_start_row?
      end
    when :black
      new_pos = [self.pos[0] - 1, self.pos[1]]
      if board.in_bounds?(new_pos) && board[new_pos].empty?
        steps << new_pos
        steps << [self.pos[0] - 2, self.pos[1]] if at_start_row?
      end
    end
    steps
  end

  def side_attacks
    steps = []

    case self.color
    when :red
      new_pos = [[self.pos[0] + 1, self.pos[1] - 1],
                [self.pos[0] + 1, self.pos[1] + 1]]
      new_pos = new_pos.select { |pos| board.in_bounds?(pos) }
      new_pos.each do |pos|
        unless board[pos].empty? && board[pos].color == :red
          steps << pos
        end
      end

    when :black
      new_pos = [[self.pos[0] - 1, self.pos[1] -1],
                [self.pos[0] - 1, self.pos[1] +1]]
      new_pos = new_pos.select { |pos| board.in_bounds?(pos) }
      new_pos.each do |pos|
        unless board[pos].empty? && board[pos].color == :black
          steps << pos
        end
      end
    end

    steps
  end

end
