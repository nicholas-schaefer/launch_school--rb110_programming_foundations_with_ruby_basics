

def leap_year?(year)
  return true if year > 1752 && year % 4 == 0

  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end


=begin
A continuation of the previous exercise.

The British Empire adopted the Gregorian Calendar in 1752, which was a leap year.
Prior to 1752, the Julian Calendar was used. Under the Julian Calendar, leap years occur in any year that is evenly divisible by 4.

Using this information, update the method from the previous exercise to determine leap years both before and after 1752.
=end
