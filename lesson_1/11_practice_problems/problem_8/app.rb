numbers = [1, 2, 3, 4]
numbers.each do |number|
  p number
  numbers.shift(1)
end

=begin
problem:
What happens when we modify an array while we are iterating over it? What would be output by this code?

1
3

=end
