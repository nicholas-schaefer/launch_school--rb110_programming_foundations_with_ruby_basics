=begin

Staggered Caps (Part 1)

Write a method that takes a String as an argument,
and returns a new String that contains the original value using a staggered capitalization scheme
in which every other character is capitalized,
and the remaining characters are lowercase.

Characters that are not letters should not be changed,
but count as characters when switching between upper and lowercase.

Example:

input: string
output: new string



=end

def staggered_case(input_str)
  new_string = ""
  input_str.chars.each_with_index do |char, index|
    if (index + 2).even?
      letter?(char) ? new_string << char.upcase : new_string << char
    else
      letter?(char) ? new_string << char.downcase : new_string << char
    end
  end
  new_string
end

def letter?(char)
  !!(/[a-zA-Z]/ =~ char)
end


p staggered_case('I Love Launch School!') == 'I LoVe lAuNcH ScHoOl!'
p staggered_case('ALL_CAPS') == 'AlL_CaPs'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 NuMbErS'
