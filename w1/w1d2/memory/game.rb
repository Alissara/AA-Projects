require_relative "board"
require_relative "card"
require_relative "human_player"
require_relative "computer_player"
require "byebug"

class Game

  def initialize(player, board)
    @player = player
    @board = board
    @previous_guess = nil
  end

  def play
    # debugger
    @board.render
    until @board.won?
      # system("clear")
      @board.render

      guess = @player.prompt(@board)
      while guess.is_a?(Array) && @board[guess].face_up
        guess = @player.prompt(@board)
      end

      value = make_guess(guess)
      @player.receive_revealed_card(guess, value)
    end
    puts "#{@player.name} win"
  end

  def make_guess(pos)
    @board[pos].reveal

    @board.render
    if @previous_guess
      check_guess(@previous_guess, pos)
    end
    # sleep(2)
    @previous_guess = @previous_guess.nil? ? pos : nil

    @board[pos].value
  end

  def check_guess(previous_guess, guess)
    if @board[previous_guess] == @board[guess]
      puts "They matched."
    else
      puts "They don't match. Try again."

      @board[previous_guess].hide
      @board[guess].hide
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  player = ComputerPlayer.new("player1")
  board = Board.new
  board.populate
  Game.new(player, board).play
end
