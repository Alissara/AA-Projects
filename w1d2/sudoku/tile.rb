require 'colorize'

class Tile
  attr_reader :value

  def initialize(value = nil)
    @color = value.nil? ? :red : :black
    @value = value
  end

  def value=(value)
    if @color == :red
      @value = value
    end
  end

  def to_s
    value.to_s.colorize(@color)
  end
end
