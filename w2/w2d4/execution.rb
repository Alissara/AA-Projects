def my_min_quad(list)

  list.each.with_index do |el1, idx1|
      min = true
    list.each.with_index do |el2, idx2|
      next if idx1 == idx2
      min = false if el2 < el1
    end

    return el1 if min
  end
end

def my_min_linear(list)
  min = list.sample
  list.each do |el|
    min = el if el < min
  end

  min
end

# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min_linear(list) == -5  # =>  -5

# O(n^2 + n) --> O(n^2)
def largest_contiguous_subsum(list)
  array = []

  (0...list.length).each do |i|
    (1..list.length).each do |j|
      array << list[i, j]
    end
  end

  max = array.first.inject(&:+)
  array.each do |sub|
    max = sub.inject(&:+) if sub.inject(&:+) > max
  end

  max
end

def largest_contiguous_subsum_n(list)
 #??
end


list = [2, 3, -6, 7, -6, 7]
p largest_contiguous_subsum(list) == 8 # => 8 (from [7, -6, 7])
list = [-5, -1, -3]
p largest_contiguous_subsum(list) == -1 # => -1 (from [-1])
