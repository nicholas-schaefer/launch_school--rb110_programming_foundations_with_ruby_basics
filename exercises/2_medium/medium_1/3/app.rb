=begin

Rotation (Part 3)

If you take a number like 735291, and rotate it to the left, you get 352917.
If you now keep the first digit fixed in place, and rotate the remaining digits, you get 329175.
Keep the first 2 digits fixed in place and rotate again to 321759.
Keep the first 3 digits fixed in place and rotate again to get 321597.
Finally, keep the first 4 digits fixed in place and rotate the final 2 digits to get 321579.
The resulting number is called the maximum rotation of the original number.

Write a method that takes an integer as argument, and returns the maximum rotation of that argument.
You can (and probably should) use the rotate_rightmost_digits method from the previous exercise.

Note that you do not have to handle multiple 0s.

Example:
735291
352917
329175
321759
321597
321579
=end

#THIS NEEDS WORK!!!!!
require "pry"

def rotate_array(input_array)
  final_array=input_array[1..-1]
  final_array.push(input_array[0])
end

def rotate_rightmost_digits(ints_array, count_rightmost_digits)
  original_order_array_ints = ints_array

  slice_to_not_change = original_order_array_ints[0...-count_rightmost_digits]
  slice_to_rotate = original_order_array_ints[-count_rightmost_digits..-1]
  rotated_slice = rotate_array(slice_to_rotate)
  rotated_array = slice_to_not_change + rotated_slice

  rotated_array.join.to_i
end

def create_array_ints(input_int)
  input_int.to_s.chars.map(&:to_i)
end


def max_rotation(int_to_rotate)
  original_order_array_ints = create_array_ints(int_to_rotate)
  digits_count = original_order_array_ints.length
  changing_array_ints = original_order_array_ints.dup

  6.downto(2) do |i|
    changing_array_ints = rotate_rightmost_digits(original_order_array_ints, i)
    # binding.pry
  end
  p changing_array_ints
end

p max_rotation(735291)# == 321579
# max_rotation(3) == 3
# max_rotation(35) == 53
# max_rotation(105) == 15 # the leading zero gets dropped
# max_rotation(8_703_529_146) == 7_321_609_845
