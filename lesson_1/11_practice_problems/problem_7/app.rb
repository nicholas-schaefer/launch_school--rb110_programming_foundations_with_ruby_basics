statement = "The Flintstones Rock"
cavemen_hash = Hash.new(0)

statement.each_char{|character| cavemen_hash[character] += 1 unless character == " "}

p cavemen_hash


=begin
Create a hash that expresses the frequency with which each letter occurs in this string:

example:
{ "F"=>1, "R"=>1, "T"=>1, "c"=>1, "e"=>2, ... }

input  = string
output = hash
=end
