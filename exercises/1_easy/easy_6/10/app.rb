=begin
What will the following code print, and why? Don't run the code until you have tried to answer.
=end

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value.dup }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2
