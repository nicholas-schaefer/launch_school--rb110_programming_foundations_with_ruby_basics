=begin

Running Totals
Write a method that takes an Array of numbers,
and returns an Array with the same number of elements,
and each element has the running total from the original Array.

A running total is the sum of all values in a list up to and including the current element.
Thus, the running total when looking at index 2 of the array [14, 11, 7, 15, 20] is 32 (14 + 11 + 7),
while the running total at index 3 is 47 (14 + 11 + 7 + 15).

running_total([2, 5, 13]) == [2, 7, 20]
running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
running_total([3]) == [3]
running_total([]) == []
running_total([]) == [0]

#inputs- array of integers
#outputs - array of integers (with same number of elements as was inputted)

explicit - each element in new array should be total of what comes before it

implicit
- if one element, return that 1 element
- if zero elements, return empty array

#data structures
Simply arrays of integers,

#Algorithm

We will need to return a collection, so either we need to create empty array up front, or use method that will return results in array
iterate through argument array
  First round through, get value of two elements starting at first elements.
  Second round, get value of two elements starting at second elements...
  Repeat process until we are get last 2 elements (stopping at 2nd to last element from end)
Return all these results as an array
=end




def running_total(array_of_ints)
  array_of_sums = []
  sum_of_everything_before = 0

  array_of_ints.length.times do | index |
    sum_of_everything_before += array_of_ints[index]
    array_of_sums << sum_of_everything_before
  end

  array_of_sums
end



p running_total([2, 5, 13]) == [2, 7, 20]
p running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
p running_total([3]) == [3]
p running_total([]) == []
p running_total([0]) == [0]
