=begin

Multiplicative Average

Write a method that takes an Array of integers as input,
multiplies all the numbers together, divides the result by the number of entries in the Array,
and then prints the result rounded to 3 decimal places.

Assume the array is non-empty.

Examples:
=end

def show_multiplicative_average(array_of_ints)
  array_of_floats = array_of_ints.map(&:to_f)
  sum_of_floats = array_of_floats.reduce(:*)
  multiplicative_average = sum_of_floats / array_of_ints.length
  '%.3f' % multiplicative_average
end

p show_multiplicative_average([3, 5])                # => The result is 7.500
p show_multiplicative_average([6])                   # => The result is 6.000
p show_multiplicative_average([2, 5, 7, 11, 13, 17]) # => The result is 28361.667

