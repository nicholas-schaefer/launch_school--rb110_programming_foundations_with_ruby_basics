=begin

Halvsies

Write a method that takes an Array as an argument,
and returns two Arrays (as a pair of nested Arrays) that contain the first half and second half of the original Array, respectively.

If the original array contains an odd number of elements,
the middle element should be placed in the first half Array.

Aloritihim
count how many elements in the array
div mod elementlength and 2
sum quotient and modulo, save as array1_el_count
Move that many elements, first however many into array 1.
Move rest of elements, however many left into array 2
return those to arrays within another array
Examples:
=end

def halvsies(input_array)
  count_of_el_in_input = input_array.length
  count_of_el_in_input.divmod(2)
  el_count_array1 = count_of_el_in_input.divmod(2).sum

  array1 = input_array[0..(el_count_array1 - 1)]
  array2 = input_array[el_count_array1, count_of_el_in_input]

  [array1, array2]
end


p halvsies([1, 2, 3, 4]) == [[1, 2], [3, 4]]
p halvsies([1, 5, 2, 4, 3]) == [[1, 5, 2], [4, 3]]
p halvsies([5]) == [[5], []]
p halvsies([]) == [[], []]
