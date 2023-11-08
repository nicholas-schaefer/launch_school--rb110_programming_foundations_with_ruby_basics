def first_century?(year)
  year < 101
end

def array_of_digits(year)
  year.to_s.chars.map { |string_number| string_number.to_i }
end

def century_integer(digits_array)
  century_maybe_1_less = digits_array.take(digits_array.length - 2)
  last_2_digits_string = digits_array.last(2).join
  last_2_digits_string == "00" ? century_maybe_1_less.join.to_s : \
                          (century_maybe_1_less.join.to_i + 1).to_s
end

def ordinalize(int_to_ordinalize)
  string_int = int_to_ordinalize.to_s

  if string_int.length > 2
    int_to_ordinalize = string_int.chars.last(2).join.to_i
  end

  last_digit = int_to_ordinalize.to_s[-1].to_i
  return "th" if [0, 4, 5, 6, 7, 9].include?(last_digit)
  return "th" if [11, 12, 13].include?(int_to_ordinalize)
  return "st" if last_digit == 1
  return "nd" if last_digit == 2
  return "rd" if last_digit == 3
  "ERROR!"
end

def century(year)
  return "1st" if first_century?(year)

  century_without_ordinal = century_integer(array_of_digits(year))
  ordinal = ordinalize(century_without_ordinal.to_i)

  century_without_ordinal + ordinal
end

p century(2000) == '20th'
p century(2001) == '21st'
p century(1965) == '20th'
p century(256) == '3rd'
p century(5) == '1st'
p century(10103) == '102nd'
p century(1052) == '11th'
p century(1127) == '12th'
p century(11201) == '113th'
