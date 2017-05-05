require 'byebug'

# O(n! * n)
def first_anagram?(str1, str2)
  all = str1.chars.permutation.to_a
  all.each do |word|
    return true if word.join == str2
  end
  false
end

# p first_anagram?("gizmo", "sally") == false
# p first_anagram?("elvis", "lives") == true

#O(n^2)
def second_anagram?(str1, str2)
  return false if str1.length != str2.length
  str1_copy = str1.dup
  str2_copy = str2.dup

  (0...str1.length).each do |i|
    if str2.include?(str1[i])
      str1_copy.delete!(str1[i])
    end
  end

  (0...str2.length).each do |i|
    if str1.include?(str2[i])
      str2_copy.delete!(str2[i])
    end
  end


  return true if str1_copy.empty? && str2_copy.empty?
  false
end

# p second_anagram?("gizmo", "sally") == false
# p second_anagram?("elvis", "lives") == true

# time = O(n log n)
# space = O(2n) -> O(n)
def third_anagram?(str1, str2)
  str1.chars.sort! == str2.chars.sort!
end

# p third_anagram?("gizmo", "sally") == false
# p third_anagram?("elvis", "lives") == true

# Time: O(n)
# Space: O(1)
def fourth_anagram?(str1, str2)
  str1_counts = Hash.new(0)
  str2_counts = Hash.new(0)

  str1.chars.each { |letter| str1_counts[letter] += 1 }
  str2.chars.each { |letter| str2_counts[letter] += 1 }

  str1_counts == str2_counts
end

# p fourth_anagram?("gizmo", "sally") == false
# p fourth_anagram?("elvis", "lives") == true

# Time: O(n)
# Space: O(1)
def bonus_anagram?(str1, str2)
  counts = Hash.new(0)

  str1.chars.each { |letter| counts[letter] += 1 }
  str2.chars.each { |letter| counts[letter] -= 1 }

  counts.values.all? { |value| value == 0 }
end 

p bonus_anagram?("gizmo", "sally") == false
p bonus_anagram?("elvis", "lives") == true
