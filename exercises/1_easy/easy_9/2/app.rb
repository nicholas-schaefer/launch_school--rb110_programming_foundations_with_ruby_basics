=begin

Double Doubles

A double number is a number with an even number of digits whose left-side digits are exactly the same as its right-side digits.
For example, 44, 3333, 103103, 7676 are all double numbers. 444, 334433, and 107 are not.

Write a method that returns 2 times the number provided as an argument, unless the argument is a double number; double numbers should be returned as-is.

Examples:

twice(37) == 74
twice(44) == 44
twice(334433) == 668866
twice(444) == 888
twice(107) == 214
twice(103103) == 103103
twice(3333) == 3333
twice(7676) == 7676
twice(123_456_789_123_456_789) == 123_456_789_123_456_789
twice(5) == 10

Note: underscores are used for clarity above.

Ruby lets you use underscores when writing long numbers;
however, it does not print the underscores when printing long numbers.

Don't be alarmed if you don't see the underscores when running your tests.
=end

def twice(input_int)
  return input_int * 2 unless double_number?(input_int)
  input_int
end

def double_number?(input_int)
  input_str = input_int.to_s
  char_count = input_str.length
  return false unless char_count.even?

  half_char_count = char_count/2.0

  left_side   = input_str[0...half_char_count.floor]
  right_side  = input_str[half_char_count.ceil..-1]

  left_side == right_side
end

# p double_number?(3344334)

p twice(37) == 74
p twice(44) == 44
p twice(334433) == 668866
p twice(444) == 888
p twice(107) == 214
p twice(103103) == 103103
p twice(3333) == 3333
p twice(7676) == 7676
p twice(123_456_789_123_456_789) == 123_456_789_123_456_789
p twice(5) == 10
