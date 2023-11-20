=begin

All Substrings

Write a method that returns a list of all substrings of a string.
The returned list should be ordered by where in the string the substring begins.
This means that all substrings that start at position 0 should come first,
then all substrings that start at position 1, and so on.

Since multiple substrings will occur at each position,
the substrings at a given position should be returned in order from shortest to longest.

You may (and should) use the leading_substrings method you wrote in the previous exercise:

Examples:
=end

def leading_substrings(str_input)
  array_of_substrings = []
  input_char_length = str_input.length

  1.upto(input_char_length) do |index_end_range|
    array_of_substrings << str_input[0, index_end_range]
  end
  array_of_substrings
end

def substrings(str_input)
  biggest_array_of_substrings = []
  str_input.chars.each_index do |i|
    biggest_array_of_substrings += leading_substrings(str_input[i..-1])
  end
  biggest_array_of_substrings
end


p substrings('abcde') == [
  'a', 'ab', 'abc', 'abcd', 'abcde',
  'b', 'bc', 'bcd', 'bcde',
  'c', 'cd', 'cde',
  'd', 'de',
  'e'
]
