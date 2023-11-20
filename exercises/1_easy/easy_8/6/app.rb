=begin

Double Char (Part 1)

Write a method that takes a string, and returns a new string in which every character is doubled.

Examples:

repeater('Hello') == "HHeelllloo"
repeater("Good job!") == "GGoooodd  jjoobb!!"
repeater('') == ''

=end

def repeater(input_str)
  chars_array_single =  input_str.split("")
  chars_array_doubled = chars_array_single.zip(chars_array_single).flatten
  chars_array_doubled.join
end


p repeater('Hello') == "HHeelllloo"
p repeater("Good job!") == "GGoooodd  jjoobb!!"
p repeater('') == ''
