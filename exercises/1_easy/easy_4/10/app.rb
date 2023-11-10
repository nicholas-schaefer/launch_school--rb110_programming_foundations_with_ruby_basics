STRINGS = {
  0 => "0",
  1 => "1",
  2 => "2",
  3 => "3",
  4 => "4",
  5 => "5",
  6 => "6",
  7 => "7",
  8 => "8",
  9 => "9",
}



def signed_integer_to_string(integer)
  return "0" if integer == 0

  negative_integer = integer.negative? ? true : false

  int_without_sign =
    if negative_integer
      calc_int_without_sign(integer.abs)
    else
      calc_int_without_sign(integer)
    end

  case negative_integer
  when true then int_without_sign.prepend("-")
  when false then int_without_sign.prepend("+")
  end
end

def calc_int_without_sign(number)
  array_of_ints = number.digits.reverse
  new_string = ""

  array_of_ints.each do |int|
    new_string << STRINGS[int]
  end
  new_string
end

p signed_integer_to_string(4321) == '+4321'
p signed_integer_to_string(-123) == '-123'
p signed_integer_to_string(0) == '0'

=begin

Convert a Signed Number to a String!

In the previous exercise, you developed a method that converts non-negative numbers to strings.
In this exercise, you're going to extend that method by adding the ability to represent negative numbers as well.

Write a method that takes an integer, and converts it to a string representation.

You may not use any of the standard conversion methods available in Ruby,
such as Integer#to_s, String(), Kernel#format, etc.
You may, however, use integer_to_string from the previous exercise.
=end
