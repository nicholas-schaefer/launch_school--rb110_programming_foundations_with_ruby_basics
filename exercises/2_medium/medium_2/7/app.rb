=begin

Unlucky Days

Write a method that returns the number of Friday the 13ths in the year given by an argument.
You may assume that the year is greater than 1752 (when the United Kingdom adopted the modern Gregorian Calendar) and that it will remain in use for the foreseeable future.

=end

#t = Time.new()

# t = Time.new(2023, 11, 13, 0, 0, 0.0 )
# p t


def friday_13th(year_to_check)
  counter_fridays = 0
  1.upto(12) do |month|
    counter_fridays += 1 if Time.new(year_to_check, month, 13).friday?
  end
  counter_fridays
end



p friday_13th(2015) == 3
p friday_13th(1986) == 1
p friday_13th(2019) == 2
