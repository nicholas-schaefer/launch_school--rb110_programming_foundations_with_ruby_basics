=begin
Write a method that takes an array of strings,
and returns an array of the same string values, except with the vowels (a, e, i, o, u) removed.

Input: Array of Strings
Output: Array SAME STRING VALUES ( we need to mutate, not return new string)

Examples above
Explicit- always will be string

Implicit
- if all vowels in one word, return that entry as an empty string

Data Structure
Will need a collection for holding vowels, possibly array, or hash. My money is on array

Alorithim
  Create "vowel collection"(array) containing vowelse (a, e, i, o, u) as elements
  Iterate through input array elements to get individual strings
  Iterate through individual strings
  - check if any element is a vowel by comparing element to vowel collection elements
    - if elelement is not a vowel leave it be
    - if element is a vowel, destroy it with malice!
  return string at end

relevant methods
- Array#include?
or
- Array#any?

iteration
- Array#Select!

=end

def remove_vowels(array_of_strings)
  vowels_array = %w(a e i o u)
  vowels_array += vowels_array.map{|el| el.capitalize}
  array_of_characters = nil

  array_of_strings.each.map do |string|
    array_of_characters = string.chars
    array_of_characters.select! do |char|
      vowels_array.include?(char) == false
    end
    array_of_characters.join
  end
end




p remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
p remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
p remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']
