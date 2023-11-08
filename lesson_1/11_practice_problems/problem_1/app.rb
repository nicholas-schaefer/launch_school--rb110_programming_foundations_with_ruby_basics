flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

cavemen_hash = {}
flintstones.each_with_index do |value, index|
  cavemen_hash[value] = index
end
p cavemen_hash







=begin
Turn this array into a hash where the names are the keys and the values are the positions in the array.
input: array
output hash

examples
{"Fred" => 0, "Barney" => 1}
=end
