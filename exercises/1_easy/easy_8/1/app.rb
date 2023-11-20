=begin

Sum of Sums

Write a method that takes an Array of numbers and then returns the sum of the sums of each leading subsequence for that Array.
You may assume that the Array always contains at least one number.

Examples:
=end

def sum_of_sums(array_of_ints)
  count_ints = array_of_ints.size
  array_of_sums = []

  array_of_ints.each_with_index do |int, index|
    array_of_sums << int * (count_ints - index)
  end
  array_of_sums.sum
end

p sum_of_sums([3, 5, 2]) == (3) + (3 + 5) + (3 + 5 + 2) # -> (21)
p sum_of_sums([1, 5, 7, 3]) == (1) + (1 + 5) + (1 + 5 + 7) + (1 + 5 + 7 + 3) # -> (36)
p sum_of_sums([4]) == 4
p sum_of_sums([1, 2, 3, 4, 5]) == 35
