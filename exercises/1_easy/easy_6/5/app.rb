=begin

Reversed Arrays (Part 2)

Write a method that takes an Array, and returns a new Array with the elements of the original list in reverse order. Do not modify the original list.
=end

def reverse!(input_array)
  return input_array if input_array.empty?

  initial_array_length = input_array.length
  half_initial_array_length = initial_array_length / 2

  duplicated_array = input_array.dup



  (0..half_initial_array_length).each do |counter|

    duplicated_array[0 + counter] = input_array[-counter - 1]
    duplicated_array[-counter - 1] = input_array[0 + counter]
    # p input_array
    # p "---"
  end
  # p "XXXXXXXXX"
  p duplicated_array
end

my_array = %w(a b e d c)
p reverse!(my_array) == ["c", "d", "e", "b", "a"]

my_array = ['abc']
p reverse!(my_array) == ["abc"]

my_array = []
p reverse!(my_array) == []
