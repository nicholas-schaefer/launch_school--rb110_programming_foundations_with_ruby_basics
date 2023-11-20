=begin

Sequence Count

Create a method that takes two integers as arguments.

The first argument is a count,
and the second is the first number of a sequence that your method will create.

The method should return an Array that contains the same number of elements as the count argument,
while the values of each element will be multiples of the starting number.

You may assume that the count argument will always have a value of 0 or greater,
while the starting number can be any integer value.

If the count is 0, an empty list should be returned.
=end

require "pry"

def sequence(input_count, input_first_sequence_int)
  return Array.new(input_count, 0) if input_first_sequence_int == 0
  results_array = []

  initial_value = input_first_sequence_int
  step_value =    input_first_sequence_int
  last_value =    input_count * input_first_sequence_int

  initial_value.step(by: step_value, to: last_value) {|i| results_array.push(i)}
  results_array
end


p sequence(5, 1) == [1, 2, 3, 4, 5]
p sequence(4, -7) == [-7, -14, -21, -28]
p sequence(3, 0) == [0, 0, 0]
p sequence(0, 1000000) == []
