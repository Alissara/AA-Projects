class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    return 0.hash if self.flatten.empty?
    hash_sum = 0
    each_with_index do |el, idx|
      hash_sum += el ** idx
    end
    hash_sum.hash
  end
end

class String
  def hash
    self.chars.map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    running_sum = 0
    self.to_a.sort.each_with_index do |pair, idx|
      pair_sum = 0
      pair.each do |el|
        if el.is_a?(Symbol)
          pair_sum += el.to_s.ord.hash
        elsif el.is_a?(Fixnum)
          pair_sum += el.hash
        elsif el.is_a?(String)
          pair_sum += el.ord.hash
        end
      end
      running_sum += (pair_sum ** idx)
    end
    running_sum
  end

end
