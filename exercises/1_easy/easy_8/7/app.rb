=begin

Double Char (Part 2)

Write a method that takes a string, and returns a new string in which every consonant character is doubled.
Vowels (a,e,i,o,u), digits, punctuation, and whitespace should not be doubled.

Examples:
=end

def double_consonants(input_str)
  alphabet = ("a".."z").to_a
  vowels = %w(a e i o u)
  consonants = []
  alphabet.each{ |letter| consonants << letter if vowels.none?(letter) }

  consonants_doubled = ""
  input_str.each_char do |char|
    case consonants.any?(char.downcase)
    when true   then consonants_doubled.concat(char, char)
    when false  then consonants_doubled.concat(char)
    else
    end
  end
  consonants_doubled
end


p double_consonants('String') == "SSttrrinngg"
p double_consonants("Hello-World!") == "HHellllo-WWorrlldd!"
p double_consonants("July 4th") == "JJullyy 4tthh"
p double_consonants('') == ""
