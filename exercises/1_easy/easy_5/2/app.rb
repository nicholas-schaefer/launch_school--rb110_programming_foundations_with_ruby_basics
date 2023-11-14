#need to finish

def time_of_day(input)
  return "not an integer!" unless input.is_a? Integer

  int_spaceship = input <=> 0
  return 0 if int_spaceship == 0

  int_abs_under_1440 = int_under_1_day(input.abs)
  amount_to_modify = int_abs_under_1440 * int_spaceship
  make_it_positive(amount_to_modify)

end

def int_under_1_day(int)
  int_div_mod = int.divmod(1440)
  return int_div_mod[1] if int_div_mod[0] < 1
  int_under_1_day(int - 1440)
end

def make_it_positive(int)
  return int if int.positive?
  return 1440 + int if int.negative?
end


# p int_under_1_day(0)
# p int_under_1_day(-1)
# p int_under_1_day(1)
# p int_under_1_day("hello")

p time_of_day(0)# == "00:00"
p time_of_day(-3)# == "23:57"
p time_of_day(35)# == "00:35"
p time_of_day(1535)# == "00:95"
p time_of_day(-1437)# == "00:03"
p time_of_day(-1400)# == "00:40"
# time_of_day(3000)# == "02:00"
# time_of_day(800)# == "13:20"
# time_of_day(-4231)# == "01:29"



=begin

After Midnight (Part 1)

The time of day can be represented as the number of minutes before or after midnight.
If the number of minutes is positive, the time is after midnight.
If the number of minutes is negative, the time is before midnight.
Can go beyond 1 day (1440 minutes in 1 day)

Write a method that takes a time using this minute-based format and returns the time of day in 24 hour format (hh:mm).
Your method should work with any integer input.

You may not use ruby's Date and Time classes.

Examples:


Input - Integer
Output - String

Rules: we are not using am/pm
Rules - can be negative, positive, and 0

Algorithim
Check if number is positive or negative
- if it has a sign in it, store it and return it removed

If it is negative number, convert it into positive equivalent
 -(subtract number from 2400)

 If number is greater than 2400, divide by 2400 and find modulo,

 Use modulo to calculate time
 Convert time from int to string and return it



=end
