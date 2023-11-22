=begin

Rotation (Part 2)

Write a method that can rotate the last n digits of a number. For example:
Note that rotating just 1 digit results in the original number being returned.

You may use the rotate_array method from the previous exercise if you want. (Recommended!)

You may assume that n is always a positive integer.
=end

def rotate_array(input_array)
  final_array=input_array[1..-1]
  final_array.push(input_array[0])
end

def rotate_rightmost_digits(int_to_rotate, count_rightmost_digits)
  original_order_array_ints = int_to_rotate.to_s.chars.map(&:to_i)

  slice_to_not_change = original_order_array_ints[0...-count_rightmost_digits]
  slice_to_rotate = original_order_array_ints[-count_rightmost_digits..-1]
  rotated_slice = rotate_array(slice_to_rotate)
  rotated_array = slice_to_not_change + rotated_slice

  rotated_array.join.to_i
end

p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
