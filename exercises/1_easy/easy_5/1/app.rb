def ascii_value input
  return unless input.is_a? String
  input.chars.map { |char| char.ord }.sum
end



p ascii_value('Four score')# == 984
p ascii_value('Launch School')# == 1251
p ascii_value('a')# == 97
p ascii_value('')# == 0




=begin

ASCII String Value

Write a method that determines and returns the ASCII string value of a string that is passed in as an argument.
The ASCII string value is the sum of the ASCII values of every character in the string.
(You may use String#ord to determine the ASCII value of a character.)

=end
