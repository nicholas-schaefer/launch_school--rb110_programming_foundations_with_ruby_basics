=begin

Group Anagrams

Given the array...

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

Write a program that prints out groups of words that are anagrams.
Anagrams are words that have the same exact letters in them but in a different order.

Your output should look something like this:

["demo", "dome", "mode"]
["neon", "none"]
#(etc)
=end

require "pry"

def anagrams(input_anagrams_array)
  solution_anagrams_array = []
  length_input_anagrams_array = input_anagrams_array.length

  input_anagrams_array.each_with_index do |word, i|
    first_word_letters_hash = letters_hash(word)
    sub_array =[]
    (i+1).upto(length_input_anagrams_array - 1) do |index|
      second_word_letters_hash = letters_hash(input_anagrams_array[index])
      first_word_letters_hash == second_word_letters_hash
      if first_word_letters_hash == second_word_letters_hash
        sub_array.push(word, input_anagrams_array[index] ).uniq!
      end
    end
    solution_anagrams_array.push(sub_array)
  end
  solution_anagrams_array.uniq.reject(&:empty?)
end

def letters_hash(str_to_hash)
  array_of_chars = str_to_hash.chars
  (array_of_chars.each_with_object(Hash.new(0)) do |char, chars_count|
    chars_count[char] += 1
  end)
end

def are_they_anagrams?(str1, str2)
  letters_hash(str1) == letters_hash(str2)
end

#p letters_hash("demod")

words =  ['demo', 'none', 'tied', 'evil', 'dome', 'mode', 'live',
          'fowl', 'veil', 'wolf', 'diet', 'vile', 'edit', 'tide',
          'flow', 'neon']

p anagrams(words)
