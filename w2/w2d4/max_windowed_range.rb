
# Space : O(n)
# Time: O(n * time of max)
def windowed_max_range(arr, window_size)
  current_max_range = 0

  arr.each_index do |i|
    sub = arr[i, window_size]
    current_range = sub.max - sub.min
    current_max_range = current_range if current_range > current_max_range
  end

  current_max_range
end

p windowed_max_range([1, 0, 2, 5, 4, 8], 2) == 4 # 4, 8
p windowed_max_range([1, 0, 2, 5, 4, 8], 3) == 5 # 0, 2, 5
p windowed_max_range([1, 0, 2, 5, 4, 8], 4) == 6 # 2, 5, 4, 8
p windowed_max_range([1, 3, 2, 5, 4, 8], 5) == 6 # 3, 2, 5, 4, 8
