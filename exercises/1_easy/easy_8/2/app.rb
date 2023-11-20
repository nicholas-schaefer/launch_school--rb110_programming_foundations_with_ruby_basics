=begin

Leading Substrings

Write a method that returns a list of all substrings of a string that start at the beginning of the original string.
The return value should be arranged in order from shortest to longest substring.

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

p leading_substrings('abc') == ['a', 'ab', 'abc']
p leading_substrings('a') == ['a']
p leading_substrings('xyzzy') == ['x', 'xy', 'xyz', 'xyzz', 'xyzzy']
