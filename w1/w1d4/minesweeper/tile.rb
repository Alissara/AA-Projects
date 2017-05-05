

class Tile
  attr_accessor :revealed, :flagged, :bombed
  attr_reader :board

  def initialize(board)
    @bombed = false
    @flagged = false
    @revealed = true
    @board = board
  end

  def reveal
    @revealed = true
  end

  def flag
    @flagged = true
  end

  def bomb
    @bombed = true
  end

  def neighbors(pos)
    neigh_pos = []
    row, col = pos.first, pos.last
    rows = (row - 1 .. row + 1).to_a
    cols = (col - 1 .. col + 1).to_a
    rows.each do |row|
      cols.each do |col|
        neigh_pos << [row, col]
      end
    end
    neigh_pos
  end

  def neighbor_bomb_count(pos)
    all_neigh = neighbors(pos)
    all_neigh.count { |n_pos| board[n_pos].bombed }
  end


end
