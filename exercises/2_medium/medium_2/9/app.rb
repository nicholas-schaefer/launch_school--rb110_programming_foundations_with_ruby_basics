=begin
array = [5, 3]
bubble_sort!(array)
array == [3, 5]

array = [6, 2, 7, 1, 4]
bubble_sort!(array)
array == [1, 2, 4, 6, 7]

array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
bubble_sort!(array)
array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
=end

def bubble_sort!(input_arr)
  digits_count = input_arr.length
  dup_input_arr = input_arr.dup
  swaps_counter = 0

  loop do
    (0...digits_count-1).each do |index|
      # p [dup_input_arr[index], dup_input_arr[index + 1] ]
      if dup_input_arr[index] > dup_input_arr[index + 1]
        swaps_counter += 1
        input_arr[index]      = dup_input_arr[index + 1]
        input_arr[index + 1]  = dup_input_arr[index]
        dup_input_arr = input_arr.dup
      end
      # p input_arr
    end
    swaps_counter == 0 ? break : swaps_counter = 0
  end
  nil
end

# array = [5, 3]
# bubble_sort!(array)
# p array == [3, 5]

# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array == [1, 2, 4, 6, 7]

# array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# p array == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
