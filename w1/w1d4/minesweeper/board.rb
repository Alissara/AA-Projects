require 'byebug'
require_relative 'tile'


class Board
attr_accessor :grid, :positions

  def initialize
    @grid = Array.new(9) { Array.new(9) }
    populate_grid
    populate_bombs
  end

  def populate_grid
    find_positions.each do |pos|
      self[pos] = Tile.new(self)
    end
  end


  def find_positions
    positions = []
    (0..8).each do |row|
      (0..8).each do |col|
        positions << [row, col]
      end
    end
    positions
  end

  def populate_bombs
    find_positions.sample(10).each do |pos|
      self[pos].bomb
    end
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    grid[row][col] = val
  end

  def render_row(row, num)
    row_str = ""
    row.each.with_index do |tile, i|
      pos = [num, i + 1]
      if tile.revealed
        row_str << (tile.bombed ? " X " : " #{tile.neighbor_bomb_count(pos)} ")
      elsif tile.flagged
        row_str << " |> "
      else
        row_str << " * "
      end
    end
    puts row_str
  end

  def render
    grid.each.with_index do |row, i|
      render_row(row, i + 1)
    end
  end
end
