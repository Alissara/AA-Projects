class Game
  attr_accessor :fragment

  def initialize(num_of_players)
    @players = Array.new(num_of_players, Player.new)
    @fragment = ""
    @dictionary = Dictionary.new
    @current_player_idx = 0
  end

  def play_round
  end

  def current_player
    @players[@current_player_idx]
  end

  def next_player!
    @current_player = (@current_player_idx + 1) % @players.size
  end



end
