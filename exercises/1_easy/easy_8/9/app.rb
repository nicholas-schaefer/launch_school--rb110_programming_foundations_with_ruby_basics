=begin

Reverse It (Part 2)

Write a method that takes one argument, a string containing one or more words,
and returns the given string with words that contain five or more characters reversed.

Each string will consist of only letters and spaces.
Spaces should be included only when more than one word is present.

Examples:

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS
=end

def reverse_words(input_str)

  words_array =             input_str.split
  words_array_sizes =       words_array.map(&:length)
  words_strings_and_sizes = words_array_sizes.zip(words_array)

  beginning_index = 0
  words_strings_and_sizes.each do |sub_array|
    word_size = sub_array[0]
    word = sub_array[1]
    if word_size > 4
      input_str[beginning_index...(beginning_index + word_size)] = word.reverse
    end
    beginning_index += (word_size + 1)
  end
  input_str
end

p reverse_words('Professional')           == "lanoisseforP"
p reverse_words('Walk around the block')  == "Walk dnuora the kcolb"
p reverse_words('Launch School')          == "hcnuaL loohcS"
