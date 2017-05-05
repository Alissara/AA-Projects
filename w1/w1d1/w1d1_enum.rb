class Array
  def my_each(&proc)

    self.length.times do |i|
      proc.call(self[i])
    end

    self
  end

  def my_select(&proc)
    answer = []

    self.my_each do |x|
      answer << x if proc.call(x)
    end

    answer
  end

  def my_reject(&proc)
    answer = []
    self.my_each do |element|
      answer << element unless proc.call(element)
    end
    answer
  end

  def my_all?(&proc)
    self.my_each do |el|
        return false unless proc.call(el)
      end
    end
    true
  end

  def my_any?(&proc)
    self.my_each do |el|
      return true if proc.call(el)
    end
    false
  end

  def my_flatten
    answer = []
    self.my_each do |el|
      if el.is_a?(Array)
        el.my_flatten.my_each do |sub_el|
          answer << sub_el
        end
      else
        answer << el
      end
    end
    answer
  end

  def my_zip(*arg)
    answer = []
    self.each_with_index do |el, idx|
      result = []
      result << el
      arg.each do |arg_el|
        result << arg_el[idx]
      end
      answer << result
    end
    answer
  end

  def my_rotate(shifty = 1)
    answer = Array.new(self.length)
    self.each_with_index do |el, idx|
      answer[(idx - shifty) % self.length] = el
    end
    answer
  end

  def my_join(delimiter = "")
    answer = ""
    self.each_with_index do |el, idx|
      answer += el
      if idx != self.length - 1
        answer += delimiter
      end
    end
    answer
  end

  def my_reverse
    answer = []
    self.each { |el| answer.unshift(el) }
    answer
  end

end

#[1, 2, 3].my_each { |i| p i }
#p [1, 2, 3].my_select { |i| i % 2 == 0 }

# a = [1, 2, 3]
# p a.my_reject { |num| num > 1 } # => [1]
# p a.my_reject { |num| num == 4 } # => [1, 2, 3]

# a = [1, 2, 3]
# p a.my_any? { |num| num > 1 } # => true
# p a.my_any? { |num| num == 4 } # => false
# p a.my_all? { |num| num > 1 } # => false
# p a.my_all? { |num| num < 4 } # => true

# p [1, 2, 3, [4, [5, 6]], [[[7]], 8]].my_flatten

# a = [ 4, 5, 6 ]
# b = [ 7, 8, 9 ]
# p [1, 2, 3].my_zip(a, b) == [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
# p a.my_zip([1,2], [8])   == [[4, 1, 8], [5, 2, nil], [6, nil, nil]]
# p [1, 2].my_zip(a, b)    == [[1, 4, 7], [2, 5, 8]]
#
# c = [10, 11, 12]
# d = [13, 14, 15]
# p [1, 2].my_zip(a, b, c, d)    == [[1, 4, 7, 10, 13], [2, 5, 8, 11, 14]]

# a = [ "a", "b", "c", "d" ]
# p a.my_rotate        == ["b", "c", "d", "a"]
# p a.my_rotate(2)     == ["c", "d", "a", "b"]
# p a.my_rotate(-3)     == ["b", "c", "d", "a"]
# p a.my_rotate(15)    == ["d", "a", "b", "c"]

# a = [ "a", "b", "c", "d" ]
# p a.my_join         # => "abcd"
# p a.my_join("$")    # => "a$b$c$d"
p [ "a", "b", "c" ].my_reverse   #=> ["c", "b", "a"]
p [ 1 ].my_reverse               #=> [1]
