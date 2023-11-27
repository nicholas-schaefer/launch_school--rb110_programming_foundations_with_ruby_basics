=begin

Triangle Sides

A triangle is classified as follows:

    equilateral All 3 sides are of equal length
    isosceles 2 sides are of equal length, while the 3rd is different
    scalene All 3 sides are of different length

To be a valid triangle,
the sum of the lengths of the two shortest sides must be greater than the length of the longest side,
and all sides must have lengths greater than 0: if either of these conditions is not satisfied, the triangle is invalid.

Write a method that takes the lengths of the 3 sides of a triangle as arguments,
and returns a symbol
  :equilateral,
  :isosceles,
  :scalene,
  or :invalid depending on whether the triangle is equilateral, isosceles, scalene, or invalid.
=end

def triangle(side1, side2, side3)
  arr_triangle_sides = [side1, side2, side3]
  return :invalid unless valid_triangle?(arr_triangle_sides)

  case arr_triangle_sides.uniq.length
  when 1 then :equilateral
  when 2 then :isosceles
  when 3 then :scalene
  else
  end
end

def valid_triangle?(arr_triangle_sides)
  return false if arr_triangle_sides.any?(&:zero?)

  arr_sides_small_to_big = arr_triangle_sides.sort{|a,b| a <=> b}
  arr_smallest_2_sides = arr_sides_small_to_big[0..1]
  sum_smallest_2_sides = arr_smallest_2_sides.sum
  largest_side = arr_sides_small_to_big[2]
  return false unless sum_smallest_2_sides > largest_side

  true
end

p triangle(3, 3, 3) == :equilateral
p triangle(3, 3, 1.5) == :isosceles
p triangle(3, 4, 5) == :scalene
p triangle(0, 3, 3) == :invalid
p triangle(3, 1, 1) == :invalid
