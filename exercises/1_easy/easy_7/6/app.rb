=begin

Staggered Caps (Part 2)

Modify the method from the previous exercise so it ignores non-alphabetic characters
when determining whether it should uppercase or lowercase each letter.

The non-alphabetic characters should still be included in the return value;
they just don't count when toggling the desired case.

Example:
=end



def staggered_case(input_str)
  need_to_upcase = true
  new_string = ""
  input_str.chars.each_with_index do |char, index|
    if letter?(char)
      need_to_upcase ? new_string << char.upcase : new_string << char.downcase
      need_to_upcase = !need_to_upcase
    else
      new_string << char
    end
  end
  new_string
end

def letter?(char)
  !!(/[a-zA-Z]/ =~ char)
end


p staggered_case('I Love Launch School!') == 'I lOvE lAuNcH sChOoL!'
p staggered_case('ALL CAPS') == 'AlL cApS'
p staggered_case('ignore 77 the 444 numbers') == 'IgNoRe 77 ThE 444 nUmBeRs'
