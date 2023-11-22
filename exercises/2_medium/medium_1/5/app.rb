=begin

Diamonds!
Write a method that displays a 4-pointed diamond in an n x n grid,
where n is an odd integer that is supplied as an argument to the method.

You may assume that the argument will always be an odd integer.

input: Integer (odd int)
output nil (diamaond printed to screen)
=end


def diamond(row_count)
  half_row_count = row_count / 2
  arr_half_num_stars_to_print = []

  1.upto(half_row_count){|i| arr_half_num_stars_to_print << i*2 -1}

  arr_num_stars_to_print = arr_half_num_stars_to_print + [row_count] + arr_half_num_stars_to_print.reverse

  arr_num_stars_to_print.each{|count_to_print| print_stars(count_to_print, row_count)}

end

def print_stars(num_stars_to_print, total_line_chars)
  stars_chars = ""
  str_padding = ""
  count_chars_to_pad = (total_line_chars - num_stars_to_print)/2
  count_chars_to_pad.times{|_| str_padding << " "}
  num_stars_to_print.times{|_| stars_chars << "*"}
p str_padding + stars_chars + str_padding
end

diamond(1)
p "---"
diamond(3)
p "---"
diamond(9)

# p print_stars(5, 9)




=begin
Examples
diamond(1)

*

diamond(3)

 *
***
 *

diamond(9)

    *
   ***
  *****
 *******
*********
 *******
  *****
   ***
    *
=end
