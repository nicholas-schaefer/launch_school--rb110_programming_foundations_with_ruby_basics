=begin

Name Swapping

Write a method that takes
a first name, a space, and a last name passed as a single String argument,

and returns a string that contains
the last name, a comma, a space, and the first name.

Examples

swap_name('Joe Roberts') == 'Roberts, Joe'

=end

def swap_name(input_str)
  words_arr =   input_str.split(" ")
  last_name =   words_arr[-1]
  first_name =  words_arr[0]
  "#{last_name}, #{first_name}"
end

p swap_name('Joe Roberts') == 'Roberts, Joe'
