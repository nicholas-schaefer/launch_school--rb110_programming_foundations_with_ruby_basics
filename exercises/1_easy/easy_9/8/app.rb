=begin

Grocery List

Write a method which takes a grocery list (array) of fruits with quantities
and converts it into an array of the correct number of each fruit.

Example:

buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]
=end

def buy_fruit(fruit_arrays)
  fruit_arrays.each_with_object([]) do |(key, value), final_array|
    value.times{|i| final_array << key}
  end
end

p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==  ["apples", "apples", "apples", "orange", "bananas","bananas"]
