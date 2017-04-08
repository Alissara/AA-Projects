require_relative 'board'

class Piece
  attr_reader :pos, :board, :color

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def to_s
    " #{symbol} "
  end

  def empty?
    self.is_a?(NullPiece)
  end

  def symbol
    #subclass
  end

  def valid_moves
  end

  def move_into_check?(end_pos)

  end


end
