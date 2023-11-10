=begin

Convert a String to a Number!

The String#to_i method converts a string of numeric characters (including an optional plus or minus sign) to an Integer.
String#to_i and the Integer constructor (Integer()) behave similarly. In this exercise, you will create a method that does the same thing.

Write a method that takes a String of digits, and returns the appropriate number as an integer.
You may not use any of the methods mentioned above.

For now, do not worry about leading + or - signs, nor should you worry about invalid characters; assume all characters will be numeric.

You may not use any of the standard conversion methods available in Ruby to convert a string to a number, such as String#to_i, Integer(), etc.
Your method should do this the old-fashioned way and calculate the result by analyzing the characters in the string.

Examples
string_to_integer('4321') == 4321
string_to_integer('570') == 570

Data structures:
Theroetically, since string is a collection, this could be done only stayin in strings and integers
More likely, we'll want to convert string to an array, as this provides as access to more methods via the enumerable class
Possibley even a hash, showing what what integer value corresponds to each string

Alorithim

Get each digit (iteration)
Convert Digit to a number
return

=end


def string_to_first_int(char)
  case char
  when "0" then 0
  when "1" then 1
  when "2" then 2
  when "3" then 3
  when "4" then 4
  when "5" then 5
  when "6" then 6
  when "7" then 7
  when "8" then 8
  when "9" then 9
  end
end

def first_int_to_full_int(first_int, a_power_of_10)
  first_int * 10**a_power_of_10
end


def string_to_integer(string)
  array_to_sum = []
  string_length = string.length
  string_index = 0
  full_int = nil

  0.upto(string_length - 1) do |i|
    first_digit = string_to_first_int(string[i])
    full_int = first_int_to_full_int(first_digit, string_length - (1 + i))
    array_to_sum << full_int
  end

  array_to_sum.reduce(:+)

end



p string_to_integer('4321') == 4321
p string_to_integer('570') == 570
p string_to_integer('0') == 0
