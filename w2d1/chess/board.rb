require_relative 'piece'
require_relative 'display'
require_relative 'cursor'

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    self.populate
  end

  def populate
    (0..7).each do |row|
      (0..7).each do |col|
        @grid[row][col] = Piece.new
      end
    end
  end

  def [](pos)
    raise 'invalid pos' unless in_bounds?(pos)

    row, col = pos
    @grid[row][col]
  end

  def []=(pos, piece)
    raise 'invalid pos' unless in_bounds?(pos)

    row, col = pos
    @grid[row][col] = piece
  end

  def move_piece(start_pos, end_pos)
    raise "no piece at start pos" unless self[start_pos].is_a?(Piece)

    piece = self[start_pos]
    self[end_pos] = piece
    self[start_pos] = nil
  end

  def in_bounds?(pos)
    pos.all? { |num| num.between?(0,7)}
  end



end
