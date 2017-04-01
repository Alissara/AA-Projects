require 'byebug'

def range_it(start_num, end_num)
  (start_num + 1...end_num).to_a
end

# p range_it(1, 10) == [2, 3, 4, 5, 6, 7, 8, 9]
# p range_it(1, 2) == []

def range_rc(start_num, end_num)

  return [] if end_num <= start_num
  range_rc(start_num, end_num - 1) + [end_num - 1]
end

# p range_rc(1, 2)
# p range_rc(1, 4)
# p range_rc(4, 2)

def exp1(b, e)
  return 1 if e == 0
  exp1(b, e - 1) * b
end

# p exp1(2, 0)
# p exp1(2, 1)
# p exp1(2, 4)

def exp2(b, e)
  return 1          if e == 0
  half = exp2(b, e/2)

  if e.even?
    half * half
  elsif e.odd?
    b * half * half
  end
end

# p exp2(2, 0)
# p exp2(2, 1)
# p exp2(2, 3)
# p exp2(2, 4)

class Array

  def deep_dup
    self.map { |el| el.is_a?(Array) ? el.deep_dup : el }
  end

end

# a = [[1, [2], [3, [4]]]]
# b = a.deep_dup
# b[0][2][1] << 5
# p a
# p b



def fibonacci_it(n)
  arr = [1, 1]
  return [] if n <= 0
  return [1] if n == 1
  until arr.length == n
    arr << arr[-1] + arr[-2]
  end
  arr
end


# p fibonacci_it(1)
# p fibonacci_it(2)
# p fibonacci_it(3)
# p fibonacci_it(4)



def fibonacci_rc(n)
  return [0] if n == 1
  return [0, 1] if n == 2
  prev_series = fibonacci_rc(n - 1)
  prev_series << prev_series[-2] + prev_series[-1]
end

# p fibonacci_rc(1)
# p fibonacci_rc(2)
# p fibonacci_rc(3)
# p fibonacci_rc(4) #== [0, 1, 1, 2]
# p fibonacci_rc(5) #== [0, 1, 1, 2, 3]
# p fibonacci_rc(6) #== [0, 1, 1, 2, 3, 5]


def subsets(arr)
  return [[]] if arr.empty?

  # new_series = subsets(arr[0..-2]).each do |subarr|
  #   subarr << arr[-1]
  # end
  # subsets(arr[0..-2]) + new_series

  prev = subsets(arr[0..-2])
  prev.concat( prev.map { |subarr| subarr + [arr.last] } )

end

# p subsets([])  == [[]]
# p subsets([1]) == [[], [1]]
# p subsets([1, 2]) == [[], [1], [2], [1, 2]]
# p subsets([1, 2, 3]) == [[], [1], [2], [1, 2], [3], [1, 3], [2, 3], [1, 2, 3]]



def permutations(array)
  return [array] if array.length == 1

  first = array.shift

  perms = permutations(array)
  total_permutations = []
  perms.each do |perm|
    (0..perm.length).each do |i|
      total_permutations <<  perm[0 ... i]+ [first] + perm[i .. -1]
    end

  end
  total_permutations
end



p [1, 2, 3, 4].permutation.to_a
p permutations([1, 2, 3, 4]).sort
p permutations([1, 2, 3, 4]).sort == [1, 2, 3, 4].permutation.to_a



def bsearch(array, target)
  return nil if array.empty?


  n = array.length / 2
  if target == array[n]
    n
  elsif target < array[n]
    bsearch(array[0...n], target)
  elsif target > array[n]
    sub = bsearch(array[n + 1..-1], target)
    sub.nil? ? nil : sub + n + 1
  end
end

# p bsearch([1, 2, 3], 1) # => 0
# p bsearch([2, 3, 4, 5], 3) # => 1
# p bsearch([2, 4, 6, 8, 10], 6) # => 2
# p bsearch([1, 3, 4, 5, 9], 5) # => 3
# p bsearch([1, 2, 3, 4, 5, 6], 6) # => 5
# p bsearch([1, 2, 3, 4, 5, 6], 0) # => nil
# p bsearch([1, 2, 3, 4, 5, 7], 6) # => nil

def merge_sort(arr)
end

def merge(arr1, arr2)
  new_arr = []
  until arr1.empty? && arr2.empty?
    if !arr1.nil? || arr1[0] < arr2[0]
      new_arr << arr1.shift
    elsif !arr2.nil? || arr1[0] >= arr2[0]
      new_arr << arr2.shift
    end
  end
  new_arr
end

# arr1 = [5, 3, 7, 2]
# arr2 = [9, 6, 4, 8]
# p merge(arr1, arr2)
