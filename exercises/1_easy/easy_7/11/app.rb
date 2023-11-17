=begin

How Many

Write a method that counts the number of occurrences of each element in a given array.

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurrences(vehicles)

The words in the array are case-sensitive: 'suv' != 'SUV'. Once counted, print each element alongside the number of occurrences.

Expected output:

car => 4
truck => 3
SUV => 1
motorcycle => 2

=end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]
def count_occurrences(vehicles_array)
  vehicle_count = Hash.new(0)
  vehicles_array.each{ |vehicle| vehicle_count[vehicle] +=1 }
  vehicle_count.each{|key, value| puts "#{key} => #{value}"}
end


count_occurrences(vehicles)
