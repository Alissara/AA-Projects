class HumanPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def prompt(board)
    print "Which position do you want to reveal (row, col): "
    gets.chomp.split(',').map(&:to_i)
  end

  def get_input

  end

end
