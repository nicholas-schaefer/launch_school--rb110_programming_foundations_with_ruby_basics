=begin

Lettercase Percentage Ratio

In the easy exercises, we worked on a problem where we had to count the number of uppercase and lowercase characters,
as well as characters that were neither of those two. Now we want to go one step further.

Write a method that takes a string,
and then returns a hash that contains 3 entries:
- one represents the percentage of characters in the string that are lowercase letters,
- one the percentage of characters that are uppercase letters,
- and one the percentage of characters that are neither.

You may assume that the string will always contain at least one character.

Examples

letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
letter_percentages('123') == { lowercase: 0.0, uppercase: 0
=end

def letter_percentages(string_to_check)
  char_count = string_to_check.length
  char_count_float = char_count.to_f

  arr_char_types = string_to_check.chars.map{|char| calc_char_type(char)}

  count_lowercase =       arr_char_types.count("lowercase")
  count_uppercase =       arr_char_types.count("uppercase")
  count_neither =         arr_char_types.count("neither")

  percentage_lowercase =  count_lowercase == 0 ? 0.0  : count_lowercase   / char_count_float * 100
  percentage_uppercase =  count_uppercase == 0 ? 0.0  : count_uppercase   / char_count_float * 100
  percentage_neither =    count_neither ==   0 ? 0.0  : count_neither     / char_count_float * 100

  hsh_case_percentage = {lowercase: percentage_lowercase, uppercase: percentage_uppercase, neither: percentage_neither}
end

def calc_char_type(char_to_check)
  case
  when !(/[a-z]/i.match(char_to_check)) then "neither"
  when !!(/[a-z]/.match(char_to_check)) then  "lowercase"
  when !!(/[A-Z]/.match(char_to_check)) then  "uppercase"
  end
end


p letter_percentages('abCdef 123') == { lowercase: 50.0, uppercase: 10.0, neither: 40.0 }
p letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25.0 }
p letter_percentages('123') == { lowercase: 0.0, uppercase: 0.0, neither: 100.0 }
