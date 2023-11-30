=begin
1. Display the initial empty 3x3 board.
2. Ask the user to mark a square.
3. Computer marks a square.
4. Display the updated board state.
5. If winner, display winner.
6. If board is full, display tie.
7. If neither winner nor board is full, go to #2
8. Play again?
9. If yes, go to #1
10. Good bye!
=end

=begin
1. Display the initial empty 3x3 board.
___|___|___  [1,3]|[2,3]|[3,3]
___|___|___  [1,2]|[2,2]|[3,2]
   |   |     [1,1]|[2,1]|[3,1]

Calculate viable arrays (all 2 digit arrays which are permutations of range 1..(number of rows))
Store viable arrays as subarray within an immutable Viable_moves array
- Duplicate array twice, duplicated array is mutable, one for viable_human_moves and one for viable_computer_moves

1. Sub A: Create method move_viable? to determine if move is valid.
=end

=begin
1. Ask the user to mark a square.
_|_|_
_|_|_
 | |
=end

HUMAN_IS_CHOOSING = true

PIECE_X = "_X_".freeze
PIECE_O = "_Y_".freeze

PIECE_CURRENT = PIECE_X

BOARD_COORDINATE_PLANE =
  [ [1,3], [2,3], [3,3],
    [1,2], [2,2], [3,2],
    [1,1], [2,1], [3,1] ].freeze

viable_moves = BOARD_COORDINATE_PLANE.dup

ROW3 = {0 => "___", pipe1: "|", 1=> "___", pipe2: "|", 2=> "___", space: "  ", grid0: "[1,3]", pipe3: "|", grid1: "[2,3]", pipe4: "|", grid2: "[3,3]"}.freeze
ROW2 = {3 => "___", pipe1: "|", 4=> "___", pipe2: "|", 5=> "___", space: "  ", grid3: "[1,2]", pipe3: "|", grid4: "[2,2]", pipe4: "|", grid5: "[3,2]"}.freeze
ROW1 = {6 => "   ", pipe1: "|", 7=> "   ", pipe2: "|", 8=> "   ", space: "  ", grid6: "[1,1]", pipe3: "|", grid7: "[2,1]", pipe4: "|", grid8: "[3,1]"}.freeze

BOARD_DISPLAY_INITIAL = {
  "row3" => ROW3,
  "row2" => ROW2,
  "row1" => ROW1
}.freeze

BOARD_DISPLAY_CURRENT = {
  "row3" => ROW3.dup,
  "row2" => ROW2.dup,
  "row1" => ROW1.dup
}.dup

#p BOARD_DISPLAY_CURRENT.values

# puts "hello"
# puts "hello"
#pp BOARD_DISPLAY_FUN



HORIZONTAL_WIN = [
  [[1,3], [2,3], [3,3]],
  [[1,2], [2,2], [3,2]],
  [[1,1], [2,1], [3,1]],
]

#win if all the values in any array are equal

VERTICAL_WIN = [
  [[1,1], [1,2], [1,3]],
  [[2,1], [2,2], [2,3]],
  [[3,1], [3,2], [3,3]]
]

#win if all the values in any array are equal

DIAGONAL_WIN = [
  [[1,1], [2,2], [3,3]],
  [[1,3], [2,2], [3,1]]
]

diagonal_win2 = [
  [[1,1], [1,1], [1,2]],
  [:human, :human, :human]
]

#arr_test = [[1,3], [2,3], [3,3]]
arr_test = [[:human, :human, :human]]

def all_equal? arr
  arr.uniq.size == 1
end
#p all_equal?(arr_test)

def line_win? board_arr
  board_arr.each do |line_sub_array|
    return true if all_equal?(line_sub_array)
  end
  false
end
# p line_win?(diagonal_win2)
def winner?
  line_win?(HORIZONTAL_WIN) || line_win?(VERTICAL_WIN) || line_win?(DIAGONAL_WIN)
end

#p winner? horizontal_win, vertical_win, diagonal_win

#p BOARD
# p viable_moves
# viable_moves.reject! do |sub_array|
#   sub_array == [1,3]
# end
# p viable_moves

def viable_move? viable_moves, move_to_check
  viable_moves.each do |sub_array|
    return move_to_check if sub_array == move_to_check
  end
  false
end

# p viable_moves

def update_board! viable_moves, move_to_remove_array
  p grid_item_to_alter = BOARD_COORDINATE_PLANE.index(move_to_remove_array)
  BOARD_DISPLAY_CURRENT.values.each do |rows|
    if rows.keys.include?(grid_item_to_alter)
      rows[grid_item_to_alter] = PIECE_CURRENT
      rows["grid#{grid_item_to_alter}".to_sym] = "     "
    end
  end
  viable_moves.reject! do |sub_array|
    sub_array == move_to_remove_array
  end
  # p move_to_remove_array.to_s
end
update_board! viable_moves, [2,3]
p BOARD_COORDINATE_PLANE
p viable_moves
p winner?

update_board! viable_moves, [1,3]
p BOARD_COORDINATE_PLANE
p viable_moves
p winner?

update_board! viable_moves, [3,3]
p BOARD_COORDINATE_PLANE
p viable_moves
p winner?

def display_board
  BOARD_DISPLAY_CURRENT.values.each do |rows|
    puts rows.values.join
  end
end
display_board()
