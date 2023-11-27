=begin

Sum Square - Square Sum

Write a method that computes the difference between the square of the sum of the first n positive integers
and the sum of the squares of the first n positive integers.

=end

def sum_square_difference(int_to_check)
  squares_summed = (1..int_to_check).sum**2
  squared_elements_summed = (1..int_to_check).to_a.map{|element| element.pow(2)}.sum

  squares_summed - squared_elements_summed
end

p sum_square_difference(3) == 22
   # -> (1 + 2 + 3)**2 - (1**2 + 2**2 + 3**2)
p sum_square_difference(10) == 2640
p sum_square_difference(1) == 0
p sum_square_difference(100) == 25164150


# 1   1
# 3   9
# 6   36
# 10  100
# 15  225
