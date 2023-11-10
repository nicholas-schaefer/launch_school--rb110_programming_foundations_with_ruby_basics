=begin
Multiples of 3 and 5

Write a method that searches for all multiples of 3 or 5 that lie between 1 and some other number, and then computes the sum of those multiples.
For instance, if the supplied number is 20, the result should be 98 (3 + 5 + 6 + 9 + 10 + 12 + 15 + 18 + 20).

You may assume that the number passed in is an integer greater than 1.

#Problem
input - integer
output - integer

## Explicit rules
find multiples between 1 and some other number
Number passed in is integer greater than one-

## Implicit rules range is inclusive

#Examples
multisum(3) == 3# 3
multisum(5) == 8# 3 + 5
multisum(10) == 33# 3 + 5 + 6 + 9 + 10
multisum(1000) == 234168

#Data structure
Maybe a hash? key track of instances of 3's and 5s
Maybe just array, or not even?

Unclear

Algorithim.


Get all mutliples of 3's
Create a Loop beginning at Integer 3 that will increment by 3 on every loop and will break if it is greater than Passed Argument
  Save returned values to a collection, perhaps "an_array_of_3s"

Get all multiples of 5's
Repeat above logic, but swap out "3" for "5"

Get all multiples of 3's and 5's
Create new "unique collection". New Collection is result of comparing 2 collections and finding unique elements

Calculate Sum of multiples
sum all the elements in the unique collection, returning result as an array
=end


def multisum(integer)
  array_all_multiples = []
  array_all_multiples << array_multiples(3, integer)
  array_all_multiples << array_multiples(5, integer)

  array_all_multiples.flatten.uniq.sum
end

def array_multiples(multiples_of_int, high_int)
  Array.new(high_int / multiples_of_int) { |i| (i+1) * multiples_of_int }
end

def tests()
  p multisum(3) == 3
  p multisum(5) == 8
  p multisum(10) == 33
  p multisum(16) == 60
  p multisum(1000) == 234168
end
tests()
