#space O(1)
#time O(n^2)
def bad_two_sum?(arr, target)
  arr.each_with_index do |e1, idx1|
    arr.each_with_index do |e2, idx2|
      return true if e1 + e2 == target && idx1 != idx2
    end
  end
  false
end

# arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false


#space O(n)
#time O(n + n log n) => O( n log n)
def okay_two_sum?(arr, target)
  sorted = arr.sort

  s = 0
  e = -1
  until s + (-e) == arr.length
    case sorted[s] + sorted[e] <=> target
    when -1
      s += 1
    when 0
      return true
    when 1
      e -= 1
    end
  end
  false
end

# arr = [-6, -2, -1, 0, 2, 7, 13].shuffle
# p okay_two_sum?(arr, 6) == true # => should be true
# p okay_two_sum?(arr, 10) == false # => should be false

# Time O(n)
# Space O(n)
def hash_two_sum(arr, target)

  # looked in solutions
  complements = {}
  arr.each do |el|
    return true if complements[target - el]
    complements[el] = true
  end

  false
end
