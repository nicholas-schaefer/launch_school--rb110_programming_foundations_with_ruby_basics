=begin

Word to Digit

Write a method that takes a sentence string as input,
and returns the same string with any sequence of the words
'zero', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine' converted to a string of digits.

Example:

word_to_digit('Please call me at five five five one two three four. Thanks.') == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
=end

INTS = {
  1 => "one", 2 => "two", 3 => "three",\
  4 => "four", 5 => "five", 6 => "six",\
  7 => "seven", 8 => "eight", 9 => "nine"\
}.freeze

def word_to_digit(str_sentence)
  str_sentence.split().map do |word|
    words_digit_equivalent = INTS.key(word)
    words_digit_equivalent ? words_digit_equivalent : word
  end.join(' ')
end

p word_to_digit('Please call me at five five five one two three four. Thanks.')# == 'Please call me at 5 5 5 1 2 3 4. Thanks.'
