=begin

Letter Swap

Given a string of words separated by spaces,
write a method that takes this string of words and returns a string in which the first and last letters of every word are swapped.

You may assume that every word contains at least one letter, and that the string will always contain at least one word.
You may also assume that each string contains nothing but words and spaces.



Input:  string (words separated by spaces)
Output: string (first and last letters of every word are swapped)

Rules

Explicit -  Each string at least one letter
Explicit - Each string at least one word
Explicit -  Each string nothing but words and spaces
Implicit - Case is maintaied
Implicit - if 1 letter or 1 word return just that

examples
Given:
swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
swap('Abcde') == 'ebcdA'
swap('a') == 'a'

Extra?
No that's pretty good

Data Structure-
Could be simply all strings,
Arrays have more methods, probably will want to convert it to an array

Alogorithim
First take:
(Doesn't say, but lets return a new string)
Count how many words are in the string
  Iterate through each word, checking if each word has more than 1 character
    - If the word has only 1 character return original that character
    - If the word has more than 1 character, return that word with first and last characters swapped

Clever/Optimized?
This way won't need an early exit for only 2 characters
- grab first character, add it to the end,
- grab second to last character, add it to the beginning


=end

def swap(sentence)
  array_of_flipped_words = sentence.split().map do |fragment|
    duplicate_frag = fragment.dup
    duplicate_frag[0] = fragment[-1]
    duplicate_frag[-1] = fragment[0]
    duplicate_frag
  end
  array_of_flipped_words.join(" ")
end


p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
p swap('Abcde') == 'ebcdA'
p swap('a') == 'a'
