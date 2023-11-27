=begin

Matching Parentheses?

Write a method that takes a string as an argument,
and returns true if all parentheses in the string are properly balanced, false otherwise.
To be properly balanced, parentheses must occur in matching '(' and ')' pairs.

Note that balanced pairs must each start with a (, not a ).
=end

def balanced?(string_to_check)
  count_left_parentheses  = 0
  count_right_parentheses = 0
  arr_chars = string_to_check.chars

  arr_chars.each do |char|
    count_left_parentheses  += 1 if char == "("
    count_right_parentheses += 1 if char == ")"
    return false if count_right_parentheses > count_left_parentheses
  end
  return false if count_left_parentheses != count_right_parentheses
  true
end


p balanced?('What (is) this?') == true
p balanced?('What is) this?') == false
p balanced?('What (is this?') == false
p balanced?('((What) (is this))?') == true
p balanced?('((What)) (is this))?') == false
p balanced?('Hey!') == true
p balanced?(')Hey!(') == false
p balanced?('What ((is))) up(') == false
p balanced?('What ())(is() up') == false
p balanced?('What up') == true
