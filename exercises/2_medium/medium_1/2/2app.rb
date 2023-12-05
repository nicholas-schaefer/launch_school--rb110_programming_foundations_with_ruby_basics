=begin
Write a method that can rotate the last n digits of a number. For example:

rotate_rightmost_digits(735291, 1) == 735291
rotate_rightmost_digits(735291, 2) == 735219
rotate_rightmost_digits(735291, 3) == 735912
rotate_rightmost_digits(735291, 4) == 732915
rotate_rightmost_digits(735291, 5) == 752913
rotate_rightmost_digits(735291, 6) == 352917


Data:
Input: Integer
Output: Integer (certain digits rotated)

grab the last x digits, break them into their own thing

Value at index -1 becomes value at 0
Value at index -2 becomes value at 1...

smash this back into the number

=end

def rotate_rightmost_digits(int_to_check, n_to_flip)
  arr_strings_to_check = int_to_check.to_s.chars
  string_to_join_part1 = arr_strings_to_check[...-n_to_flip].join
  arr_ints_to_check = arr_strings_to_check.map(&:to_i)
  arr_ints_with_corresponding_strings = arr_ints_to_check.zip(arr_strings_to_check)

  sub_arrays = arr_ints_with_corresponding_strings[-n_to_flip..]

  shifted_sub_arrays = sub_arrays[1..] + [sub_arrays[0]]
  string_to_join_part2 = shifted_sub_arrays.map{|sub_array| sub_array[1]}.join

  string_solution = string_to_join_part1 + string_to_join_part2
  string_solution.to_i
end




p rotate_rightmost_digits(735291, 1) == 735291
p rotate_rightmost_digits(735291, 2) == 735219
p rotate_rightmost_digits(735291, 3) == 735912
p rotate_rightmost_digits(735291, 4) == 732915
p rotate_rightmost_digits(735291, 5) == 752913
p rotate_rightmost_digits(735291, 6) == 352917
