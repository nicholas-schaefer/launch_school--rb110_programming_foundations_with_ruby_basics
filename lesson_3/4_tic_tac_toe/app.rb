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
human_is_choosing = true

PIECE_X = "_X_".freeze
PIECE_O = "_0_".freeze

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

HORIZONTAL_WIN_INITIAL = [
  [[1,3], [2,3], [3,3]].freeze,
  [[1,2], [2,2], [3,2]].freeze,
  [[1,1], [2,1], [3,1]].freeze,
].freeze

HORIZONTAL_WIN = [
  [[1,3], [2,3], [3,3]],
  [[1,2], [2,2], [3,2]],
  [[1,1], [2,1], [3,1]],
]

VERTICAL_WIN_INITIAL = [
  [[1,1], [1,2], [1,3]].freeze,
  [[2,1], [2,2], [2,3]].freeze,
  [[3,1], [3,2], [3,3]].freeze
].freeze

VERTICAL_WIN = [
  [[1,1], [1,2], [1,3]],
  [[2,1], [2,2], [2,3]],
  [[3,1], [3,2], [3,3]]
]

DIAGONAL_WIN_INITIAL = [
  [[1,1], [2,2], [3,3]].freeze,
  [[1,3], [2,2], [3,1]].freeze
].freeze

DIAGONAL_WIN = [
  [[1,1], [2,2], [3,3]],
  [[1,3], [2,2], [3,1]]
]

def all_equal? arr
  arr.uniq.size == 1
end

def line_win? board_arr
  board_arr.each do |line_sub_array|
    return true if all_equal?(line_sub_array)
  end
  false
end

def winner?
  line_win?(HORIZONTAL_WIN) || line_win?(VERTICAL_WIN) || line_win?(DIAGONAL_WIN)
end

def viable_move? viable_moves, move_to_check
  viable_moves.each do |sub_array|
    return move_to_check if sub_array == move_to_check
  end
  false
end

def update_board! viable_moves, move_to_remove_array, human_is_choosing
  grid_item_to_alter = BOARD_COORDINATE_PLANE.index(move_to_remove_array)
  BOARD_DISPLAY_CURRENT.values.each do |rows|
    if rows.keys.include?(grid_item_to_alter)
      rows["grid#{grid_item_to_alter}".to_sym] = "     "

      human_is_choosing ? current_piece = PIECE_X : current_piece = PIECE_O
      rows[grid_item_to_alter] = current_piece
      if HORIZONTAL_WIN[0].find_index(move_to_remove_array)
        HORIZONTAL_WIN[0][HORIZONTAL_WIN[0].find_index(move_to_remove_array)] = current_piece
      elsif HORIZONTAL_WIN[1].find_index(move_to_remove_array)
        HORIZONTAL_WIN[1][HORIZONTAL_WIN[1].find_index(move_to_remove_array)] = current_piece
      elsif HORIZONTAL_WIN[2].find_index(move_to_remove_array)
        HORIZONTAL_WIN[2][HORIZONTAL_WIN[2].find_index(move_to_remove_array)] = current_piece
      end

      if VERTICAL_WIN[0].find_index(move_to_remove_array)
        VERTICAL_WIN[0][VERTICAL_WIN[0].find_index(move_to_remove_array)] = current_piece
      elsif VERTICAL_WIN[1].find_index(move_to_remove_array)
        VERTICAL_WIN[1][VERTICAL_WIN[1].find_index(move_to_remove_array)] = current_piece
      elsif HORIZONTAL_WIN[2].find_index(move_to_remove_array)
        VERTICAL_WIN[2][HORIZONTAL_WIN[2].find_index(move_to_remove_array)] = current_piece
      end

      if DIAGONAL_WIN[0].find_index(move_to_remove_array)
        DIAGONAL_WIN[0][DIAGONAL_WIN[0].find_index(move_to_remove_array)] = current_piece
      end
      if DIAGONAL_WIN[1].find_index(move_to_remove_array)
        DIAGONAL_WIN[1][DIAGONAL_WIN[1].find_index(move_to_remove_array)] = current_piece
      end
    end
  end
  viable_moves.reject! do |sub_array|
    sub_array == move_to_remove_array
  end
end

def prompt msg
  puts ">> #{msg}"
end

def get_valid_moves
  valid_moves = []

  2.times do |i|
    loop do
      prompt i == 0 ? 'Enter "X" move "X" coordinate:' : 'Enter "X" move "Y" coordinate:'
      raw_input = gets.chomp()
      if is_int?(raw_input)
        valid_moves << raw_input.to_i
        break
      end
      prompt "You didn't enter a valid number"
      prompt "Ty again!"
      puts "-------"
    end
  end
  valid_moves
end

def is_int? raw_input
  raw_input_converted_to_int = raw_input.to_i
  raw_input == raw_input_converted_to_int.to_s
  raw_input == raw_input_converted_to_int.to_s
end

def get_human_move viable_moves
  loop do
    prompt "Human - What's your move:"
    move_to_check = get_valid_moves()
    viable_move = viable_move? viable_moves, move_to_check
    return viable_move if viable_move
    prompt "That move has already been taken, or is not a valid move"
    prompt "Ty again!"
    puts "-------"
  end
end

def get_computer_move viable_moves
  viable_moves.sample
end

def display_board
  BOARD_DISPLAY_CURRENT.values.each do |rows|
    puts rows.values.join
  end
end

def play_again?
  loop do
    prompt "Would you like to play again? [y/n]"
    user_response = gets.chomp.downcase

    case user_response
    when "y"
      prompt "working on it..."
      return true
    when "n"
      prompt "Adios - Until We meet again"
      return false
    else
    end
    prompt "I didn't understand your response - please try again..."
    puts "\n"
  end
end


def my_app(human_is_choosing, viable_moves)
  if human_is_choosing
    puts "\n"
    puts "Current Board State"
    display_board()
    puts "\n"
  end

  if viable_moves.length == 0
    prompt "NO MOVES LEFT!!!!!!!!!!!!!! - TIE"
    prompt "GOODBYE!"
    # return unless play_again?
    # my_app(!human_is_choosing, viable_moves)
  end

  move = human_is_choosing ? get_human_move(viable_moves) : get_computer_move(viable_moves)
  update_board! viable_moves, move, human_is_choosing
  # p BOARD_COORDINATE_PLANE
  # p viable_moves

  if winner?
    puts "\n"
    puts "Current Board State"
    display_board()
    puts "\n"

    human_won = human_is_choosing ? true : false
    prompt human_won ? "You won!!!!!!!!" : "Computer wins - you suck"
    prompt "GOODBYE!"
    # return unless play_again?
    # puts "------"
    # human_is_choosing = true
    # viable_moves = BOARD_COORDINATE_PLANE.dup
    # my_app(human_is_choosing, viable_moves)
  else
    my_app(!human_is_choosing, viable_moves)
  end
end

my_app(human_is_choosing, viable_moves)
