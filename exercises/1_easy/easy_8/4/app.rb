=begin

Palindromic Substrings

Write a method that returns a list of all substrings of a string that are palindromic.
That is, each substring must consist of the same sequence of characters forwards as it does backwards.

The return value should be arranged in the same sequence as the substrings appear in the string.
Duplicate palindromes should be included multiple times.

You may (and should) use the substrings method you wrote in the previous exercise.

For the purposes of this exercise, you should consider all characters and pay attention to case;
that is, "AbcbA" is a palindrome, but neither "Abcba" nor "Abc-bA" are.

In addition, assume that single characters are not palindromes.
=end

def palindrome?(string_to_check)
  string_to_check_length = string_to_check.length
  return false unless string_to_check_length > 1

  max_chars_to_check = (string_to_check_length) / 2

  (0...max_chars_to_check).each do |index|
    left_char = string_to_check[index]
    right_char = string_to_check[-(index + 1)]
    return false unless left_char == right_char
  end
  true
end

def leading_substrings(str_input)
  array_of_substrings = []
  input_char_length = str_input.length

  1.upto(input_char_length) do |index_end_range|
    array_of_substrings << str_input[0, index_end_range]
  end
  array_of_substrings
end

def substrings(str_input)
  biggest_array_of_substrings = []
  str_input.chars.each_index do |i|
    biggest_array_of_substrings += leading_substrings(str_input[i..-1])
  end
  biggest_array_of_substrings
end

def palindromes(potential_palindrome)
  substrings(potential_palindrome).select do |potential_palindrome|
    palindrome?(potential_palindrome)
  end
end


#p palindromes('abdba')

p palindromes('abcd') == []
p palindromes('madam') == ['madam', 'ada']
p palindromes('hello-madam-did-madam-goodbye') == [
  'll', '-madam-', '-madam-did-madam-', 'madam', 'madam-did-madam', 'ada',
  'adam-did-mada', 'dam-did-mad', 'am-did-ma', 'm-did-m', '-did-', 'did',
  '-madam-', 'madam', 'ada', 'oo'
]
p palindromes('knitting cassettes') == [
  'nittin', 'itti', 'tt', 'ss', 'settes', 'ette', 'tt'
]
