=begin
Cute angles

Write a method that takes a floating point number
that represents an angle between 0 and 360 degrees
and returns a String that represents that angle in degrees, minutes and seconds.

You should use
- a degree symbol (°) to represent degrees,
- a single quote (') to represent minutes,
- and a double quote (") to represent seconds.

A degree has 60 minutes, while a minute has 60 seconds.

Examples:

dms(30) == %(30°00'00")
dms(76.73) == %(76°43'48")
dms(254.6) == %(254°36'00")
dms(93.034773) == %(93°02'05")
dms(0) == %(0°00'00")
dms(360) == %(360°00'00") || dms(360) == %(0°00'00")

Note: your results may differ slightly depending on how you round values, but should be within a second or two of the results shown.

You should use two digit numbers with leading zeros when formatting the minutes and seconds, e.g., 321°03'07".

You may use this constant to represent the degree symbol:

DEGREE = "\xC2\xB0"
=end


DEGREE = "\xC2\xB0"

def dms(degree_float)
  degrees = degree_float.to_i
  rough_minutes_and_seconds = ((degree_float - degrees) * 0.6) * 100
  minutes = rough_minutes_and_seconds.floor
  seconds = (((rough_minutes_and_seconds - minutes) * 0.6) * 100).round

  p %(#{degrees}#{DEGREE}#{ints_to_formatted_strings(minutes)}'#{ints_to_formatted_strings(seconds)})
end

def ints_to_formatted_strings(int)
  string_version = int.to_s
  string_version.prepend("0") if string_version.length == 1

  string_version
end

# p ints_to_formatted_strings(5)
# p ints_to_formatted_strings(50)

#p DEGREE

dms(30)# == %(30°00'00")
dms(76.73)# == %(76°43'48")
dms(254.6)# == %(254°36'00")
dms(93.034773)# == %(93°02'05")
dms(0)# == %(0°00'00")
dms(360)# == %(360°00'00") || dms(360) == %(0°00'00")
