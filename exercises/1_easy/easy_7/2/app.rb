=begin

Lettercase Counter

Write a method that takes a string, and then returns a hash that contains 3 entries:
- one represents the number of characters in the string that are lowercase letters,
- one represents the number of characters that are uppercase letters,
- and one represents the number of characters that are neither.

Examples
=end

def letter_case_count(string)
  cases_hash = {lowercase: 0, uppercase: 0, neither: 0}
  string.chars.each do |char|
    cases_hash[case?(char).to_sym] += 1
  end
  cases_hash
end

def case?(char)
  return "lowercase" if ("a".."z").any?(char)
  return "uppercase" if ("A".."Z").any?(char)
  return "neither"
end


p letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
p letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
p letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
p letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }
