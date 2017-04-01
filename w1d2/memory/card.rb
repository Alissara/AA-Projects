class Card
  attr_reader :face_up, :value

  def initialize(value)
    @value = value
    @face_up = false
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def to_s
    if face_up
      value.to_s
    else
      'X'
    end
  end

  def ==(card2)
    value == card2.value
  end
end
