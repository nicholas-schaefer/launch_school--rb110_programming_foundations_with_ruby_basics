

=begin

In the modern era under the Gregorian Calendar, leap years occur in every year that is evenly divisible by 4, unless the year is also divisible by 100.
If the year is evenly divisible by 100, then it is not a leap year unless the year is evenly divisible by 400.

Assume this rule is good for any year greater than year 0.
Write a method that takes any year greater than 0 as input, and returns true if the year is a leap year, or false if it is not a leap year.
leap_year?(2016) == true
leap_year?(2015) == false
leap_year?(2100) == false
leap_year?(2400) == true
leap_year?(240000) == true
leap_year?(240001) == false
leap_year?(2000) == true
leap_year?(1900) == false
leap_year?(1752) == true
leap_year?(1700) == false
leap_year?(1) == false
leap_year?(100) == false
leap_year?(400) == true


# Problem
Input - Integer (greater than 0)
Output - boolean (true if loop year, false else whise)

# Examples
leap_year?(1) == false #not divisiible by 4
leap_year?(4) == true #divisible by 4
leap_year?(200) == false #divisible by 4 and 100
leap_year?(400) == true #divisible by 4 and 100 and 400

# Data Structure
Perhaps Ranges?

# Algorithim
Simple
If number is less than 100
 - see if it is divisible by 4 or not
    - if not, return false
    - if divisible by 4 return true
If number is greater than or equal to 200
 - see if it is divisible by 4 or not
    - if not, return false
    - if divisible by 4 perform "Additional Checks":

# Additional Checks
Is it divisible by 100
  - if no, return true
  - if yes, perform "last Additional checks"

## Last Additional Checks
Is it divisible by 400
  -if no, return false
  - if yes, return yes

  Cleverer way

=end


def leap_year?(year)
  return false unless divisible_by?(4, year)
  return true if year < 100
  return true unless divisible_by?(100, year)
  return true if divisible_by?(400, year)
  false
end

def divisible_by?(int_to_check, year)
  year % int_to_check == 0
end

p leap_year?(2016) == true
p leap_year?(2015) == false
p leap_year?(2100) == false
p leap_year?(2400) == true
p leap_year?(240000) == true
p leap_year?(240001) == false
p leap_year?(2000) == true
p leap_year?(1900) == false
p leap_year?(1752) == true
p leap_year?(1700) == false
p leap_year?(1) == false
p leap_year?(100) == false
p leap_year?(400) == true
