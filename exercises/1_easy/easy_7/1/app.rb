=begin

Combine Two Lists

Write a method that combines two Arrays passed in as arguments,
and returns a new Array that contains all elements from both Array arguments, with the elements taken in alternation.

You may assume that both input Arrays are non-empty, and that they have the same number of elements.

Example:
=end

def interleave(first_array, second_array)
  (0...first_array.length).each_with_object([]) do |index, merged_array|
    merged_array.push(first_array[index], second_array[index])
  end
end


p interleave([1, 2, 3], ['a', 'b', 'c'])# == [1, 'a', 2, 'b', 3, 'c']
