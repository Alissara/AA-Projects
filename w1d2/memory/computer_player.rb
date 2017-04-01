class ComputerPlayer
  attr_reader :name

  def initialize(name)
    @name = name
    @known_cards = {}
    @matched_cards = []
    @first_guess = true
    @guessing_pos = nil
  end

  def prompt(board)
    result = nil

    if @first_guess
      if @known_cards.values.uniq == @known_cards.values
        result = random_guess(board)
      else
        result = get_matching_cards
      end
      @first_guess = false
    else
      if @guessing_pos
        result = @guessing_pos
        @guessing_pos = nil
      else
        result = random_guess(board)
      end
      @first_guess = true
    end
    # debugger
    result
  end

  def get_matching_cards
    hash = {}

    @known_cards.each do |k, v|
      if hash.has_value?(v)
        # debugger
        @guessing_pos = hash.key(v)

        receive_match(@guessing_pos, k)

        @known_cards.delete(@guessing_pos)
        @known_cards.delete(k)

        return k
      end

      hash[k] = v
    end
  end

  def random_guess(board)
    arr = []

    (0..3).each do |row|
      (0..3).each do |col|
        arr << [row, col] unless board[[row, col]].face_up
      end
    end

    arr.sample
  end

  def receive_revealed_card(pos, value)
    @known_cards[pos] = value
  end

  def receive_match(pos1, pos2)
    @matched_cards.concat([pos1, pos2])
  end


end
