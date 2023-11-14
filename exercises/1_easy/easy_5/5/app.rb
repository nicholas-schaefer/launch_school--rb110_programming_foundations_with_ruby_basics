=begin

Clean up the words

Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic characters,
write a method that returns that string with all of the non-alphabetic characters replaced by spaces.

If one or more non-alphabetic characters occur in a row, you should only have one space in the result (the result should never have consecutive spaces).

Examples:

cleanup("---what's my +*& line?") == ' what s my line '


Input, String
Output, String

Explicit
  All words
  all lowercased
  includes non-alphabetic
  Only 1 result if non alphanumeric
Implicit

Data
  We are using a STRING, must also return a STRING
  Could stay a string, but might need to convert to array for more powerful iteration methods
  Might need to involve a range, could be used so we can compare characters in alphabet to non alphabetic characters
  Might need to involve Regex

Alorithim

Brute Force:

Create a "solution" collection to hold return value (maybe array, or simply string that will have answer pushed into it)
Create a collection that holds all lowercase alphanumerics in it (possibly regex)
Create a "non_alphanumeric_counter", assigned initially to 0

Iterate through string, determine if each character is alphanumeric is not
- if it is alphanumeric add it to "solution" collection
- if it is not alphanueric, increment `non_alphanumeric_counter` variable value by 1 and check if counter is greater than 1
  - if less than 1: add blank space to "solution" collection
  - if equal to or greater than 1: do nothing except go to the next iteration.

Return STRING result (if collection is not already of type STRING, go ahead and convert it to type STRIPE )

Clever
Reges not manually created collections/Ranges
=end


ALPHABET = (Array("a".."z") + Array("A".."Z")).freeze

def cleanup(string)
  solution = ""
  sentence_length = string.length
  non_alphanumeric_counter = 0
  while_loop_counter = 0


  while while_loop_counter < sentence_length
    character = string[while_loop_counter]

    if alphanumeric?(character)
      solution << character
      while_loop_counter += 1
      next
    end

    non_alphanumeric_counter += 1
    if non_alphanumeric_counter > 1
      non_alphanumeric_counter = 0
      while_loop_counter += 1
    else
      solution << " "
      non_alphanumeric_counter += 1
      while_loop_counter += 1
    end
  end
  solution.squeeze(" ")
end


def letter?(char)
  ALPHABET.include?(char)
end

def integer?(char)
  char.is_a? Integer
end

def alphanumeric?(char)
  integer?(char) || letter?(char)
end


p cleanup("---what's my +*& line?")# == ' what s my line '
