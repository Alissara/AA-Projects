class Dictionary
  attr_reader :line

  def initialize(file_name)
    @lines = File.readlines(file_name).map(&:chomp)
  end

  def valid_fragment?(frag)
    frag = frag.downcase
    @lines.each do |word|
      return true if word.start_with?(frag)
      return false if word > frag
    end
    false
  end

  def is_word?(word)
    word = word.downcase
    @lines.each do |line|
      return true if word == line
      return false if line > word
    end
    false
  end
end

d = Dictionary.new('dictionary.txt')
p d.valid_fragment?('hell')
p d.valid_fragment?('hellz')
p d.valid_fragment?('hello')
p d.is_word?('hello')
p d.is_word?('helloz')
