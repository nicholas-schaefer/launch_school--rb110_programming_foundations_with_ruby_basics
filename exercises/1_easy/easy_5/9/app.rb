#need to do this one again!

=begin


ddaaiillyy ddoouubbllee

Write a method that

takes a string argument and
returns a new string (that contains the value of the original string with all consecutive duplicate characters collapsed into a single character.)

Explicit
You may not use String#squeeze or String#squeeze!.

Implicit
string doesn't have to just be a-z
if one character 1
if no characters than return empty string

Examples:

crunch('ddaaiillyy ddoouubbllee') == 'daily double'
crunch('4444abcabccba') == '4abcabcba'
crunch('ggggggggggggggg') == 'g'
crunch('a') == 'a'
crunch('') == ''
=end


def crunch(text)
  index = 0
  crunch_text = ''
  while index <= text.length - 1
    crunch_text << text[index] unless text[index] == text[index + 1]
    index += 1
  end
  crunch_text
end

crunch('ddaaiillyy ddoouubbllee')# == 'daily double'
# crunch('4444abcabccba') == '4abcabcba'
# crunch('ggggggggggggggg') == 'g'
# crunch('a') == 'a'
# crunch('') == ''
