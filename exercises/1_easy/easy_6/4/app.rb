=begin

Reversed Arrays (Part 1)

Input: Array
Write a method that takes an Array as an argument,

Ouput: Same Array, mutated
and reverses its elements in place; that is, mutate the Array passed into this method.
The return value should be the same Array object.

You may not use Array#reverse or Array#reverse!.

Note: for the test case list = ['abc'], we want to reverse the elements in the array.
The array only has one element, a String, but we're not reversing the String itself, so the reverse! method call should return ['abc'].

    input_array[0] = duplicated_array[-1]
    input_array[-1] = duplicated_array[0]
Examples:
=end

def reverse!(input_array)
  return input_array if input_array.empty?

  initial_array_length = input_array.length
  half_initial_array_length = initial_array_length / 2

  duplicated_array = input_array.dup

  (0..half_initial_array_length).each do |counter|

    input_array[0 + counter] = duplicated_array[-counter - 1]
    input_array[-counter - 1] = duplicated_array[0 + counter]
    # p input_array
    # p "---"
  end
  # p "XXXXXXXXX"
  p input_array
end

my_array = %w(a b e d c)
p reverse!(my_array) == ["c", "d", "e", "b", "a"]

my_array = ['abc']
p reverse!(my_array) == ["abc"]

my_array = []
p reverse!(my_array) == []
