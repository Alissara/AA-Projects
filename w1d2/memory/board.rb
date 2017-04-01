class Board

  def initialize
    @grid = Array.new(4) { Array.new(4) }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def populate
    card_values = []
    (1..8).each do |num|
      card = Card.new(num)
      card_values.concat([card, card.dup])
    end

    card_values.shuffle!

    4.times do |row|
      4.times do |col|
        @grid[row][col] = card_values[row * 4 + col]
      end
    end
  end

  def render
    @grid.each do |row|
      puts row.join('|')
      puts '-' * 7
    end
    puts ''
  end

  def won?
    @grid.flatten.all?(&:face_up)
  end

  def reveal(pos)
    @grid[pos].reveal unless @grid[pos].face_up
    @grid[pos].value
  end
end
