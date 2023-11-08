flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)


regex_to_check = /Be/
flintstones.each_with_index do |value, index|
  next unless value.match(regex_to_check)
  p index
end


=begin
Find the index of the first name that starts with "Be"

input =  array of strings
output = integer
=end
