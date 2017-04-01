require_relative "tile"

class Board

  def initialize(grid)
    @grid = grid
  end

  def self.from_file(file_name)
    new_arr = []

    File.readlines(file_name).each do |row|
      new_arr << row.chomp.chars.map do |val|
        val = val == '0' ? nil : val.to_i
        Tile.new(val)
      end
    end

    new_arr
  end

  def render
    @grid.each do |row|
      puts row.join('|')
      puts '-' * 18
    end
    puts ''
  end

  def solved?
    column? && row? && square3?
  end

  def column?
    new_arr = []
    (0...9).each do |row|
      sub_arr = []
      (0...9).each do |col|
        sub_arr << @grid[col][row].value
      end
      new_arr << sub_arr
    end

    new_arr.all? do |row|
      row.sort_by(&:to_i) == (1..9).to_a
    end

  end

  def row?
    @grid.all? do |row|
      row.map(&:value).sort_by(&:to_i) == (1..9).to_a
    end
  end

  def square3?
    arr = []

    sub_arr = []
    (0..8).each do |row|
      (0..2).each do |col|
        sub_arr << @grid[row][col].value
        if sub_arr.size == 9
          arr << sub_arr
          sub_arr = []
        end
      end
    end

    sub_arr = []
    (0..8).each do |row|
      (3..5).each do |col|
        sub_arr << @grid[row][col].value
        if sub_arr.size == 9
          arr << sub_arr
          sub_arr = []
        end
      end
    end

    sub_arr = []
    (0..8).each do |row|
      (6..8).each do |col|
        sub_arr << @grid[row][col].value
        if sub_arr.size == 9
          arr << sub_arr
          sub_arr = []
        end
      end
    end

    arr.all? do |row|
      row.sort_by(&:to_i) == (1..9).to_a
    end

  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

end

file_name = 'sudoku1.txt'
grid = Board.from_file(file_name)
board = Board.new(grid)
p board.solved?
board.render
