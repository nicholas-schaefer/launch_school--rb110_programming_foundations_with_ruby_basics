=begin

Swap Case

Write a method that takes a string as an argument
and returns a new string in which every uppercase letter is replaced by its lowercase version,
and every lowercase letter by its uppercase version. All other characters should be unchanged.

You may not use String#swapcase; write your own version of this method.

Example:
swapcase('CamelCase') == 'cAMELcASE'
swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
=end

def lowercase?(input_str)
  !!(/[a-z]/ =~ input_str)
end

def uppercase?(input_str)
  !!(/[A-Z]/ =~ input_str)
end

def swapcase(input_str)
  swapcased_str = ""
  input_str.each_char do |char|
    if lowercase?(char)
      swapcased_str << char.upcase
    elsif uppercase?(char)
      swapcased_str << char.downcase
    else
      swapcased_str << char
    end
  end
  swapcased_str
end

p swapcase('CamelCase') == 'cAMELcASE'
p swapcase('Tonight on XYZ-TV') == 'tONIGHT ON xyz-tv'
