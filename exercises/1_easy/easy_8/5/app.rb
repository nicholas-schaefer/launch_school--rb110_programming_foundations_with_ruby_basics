=begin

fizzbuzz

Write a method that takes two arguments: the first is the starting number, and the second is the ending number.

Print out all numbers from the starting number to the ending number,
except if a number is divisible by 3, print "Fizz", if a number is divisible by 5, print "Buzz",
and finally if a number is divisible by 3 and 5, print "FizzBuzz".

Example:

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
=end

def fizzbuzz(start_int, end_int)
  fizzbuzz_array = []

  (start_int..end_int).each do |int_to_check|
    divides_by_3 = divisible_by?(3, int_to_check)
    divides_by_5 = divisible_by?(5, int_to_check)

    case
    when divides_by_3 && divides_by_5 then fizzbuzz_array << "fizzbuzz"
    when divides_by_3 then fizzbuzz_array << "fizz"
    when divides_by_5 then fizzbuzz_array << "buzz"
    else fizzbuzz_array << int_to_check
    end

  end
  p fizzbuzz_array
end

def divisible_by?(divisor, dividend)
  return false if divisor == 0
  dividend % divisor == 0
end

#divisible_by?(3, 12)

fizzbuzz(1, 15) # -> 1, 2, Fizz, 4, Buzz, Fizz, 7, 8, Fizz, Buzz, 11, Fizz, 13, 14, FizzBuzz
