LEVELS = %w(two three four five six seven eight nine ten jack queen king ace).freeze
SUITS = %w(hearts diamonds clubs spades).freeze
VALUE_OF_CARD_LEVEL = {
  two:    [2].freeze,
  three:  [3].freeze,
  four:   [4].freeze,
  five:   [5].freeze,
  six:    [6].freeze,
  seven:  [7].freeze,
  eight:  [8].freeze,
  nine:   [9].freeze,
  ten:    [10].freeze,
  jack:   [10].freeze,
  queen:  [10].freeze,
  king:   [10].freeze,
  ace:    [1,11].freeze
}.freeze

VALUE_OF_CARD = LEVELS.map do |level|
  SUITS.map do |suit|
    ["#{level}_of_#{suit}".to_sym, VALUE_OF_CARD_LEVEL[level.to_sym].freeze]
  end
end.flatten(1).to_h.freeze

def prompt msg
  puts ">> #{msg}"
end

def fresh_deck
  VALUE_OF_CARD.keys
end

def dealer_draw_card! deck
  deck.delete(deck.sample)
end

def calculate_potential_hand_scores! hand, person_potential_scores
  number_of_aces = hand.select{|card| VALUE_OF_CARD[card].length == 2}.length

  if number_of_aces > 0
    array_of_ones = []
    combo_holder_array = []
    unique_combos = []
    potential_ace_values = nil

    number_of_aces.times do |_|
      array_of_ones << 1
      array_of_ones << 11
    end
    array_of_ones.sort!
    array_of_ones.combination(number_of_aces) {|combination| combo_holder_array << combination }
    unique_combos = combo_holder_array.uniq
    potential_ace_values = unique_combos.map(&:sum)

    hand_without_aces = hand.reject{|card| VALUE_OF_CARD[card].length == 2}
    hand_without_aces_numbers = hand_without_aces.map{|card| VALUE_OF_CARD[card][0]}

    combos_aces_and_others = hand_without_aces_numbers.product(potential_ace_values)
    values = combos_aces_and_others.map(&:sum).sort
    # values.each{|value| person_potential_scores << value}
    temp_array_full = []
    values.each{|value| temp_array_full << value}
    temp_array_smaller = temp_array_full[-(number_of_aces + 1)..-1]
    temp_array_smaller.each{|value| person_potential_scores << value}
    # person_potential_scores.shift(2*number_of_aces) #SEE IF THIS FIXES IT?
  elsif number_of_aces == 0
    potential_score = hand.map{|card| VALUE_OF_CARD[card][0]}.sum
    person_potential_scores << potential_score
  else
  end
  return
end

def display_hand hand, person_is_dealer, must_hide_one_card
  # tighten this up in helper method, logic for listing multiple cards...
  hand_strings_arr = hand.map{|card| card.to_s.tr("_", " ")}

  list_cards_to_display_arr = hand_strings_arr.dup

  if person_is_dealer && must_hide_one_card
    list_cards_to_display_arr.pop
    list_cards_to_display_arr << "and 1 unknown card"
  end

  prompt person_is_dealer ? "Dealer has: \n" : "You have \n"
  puts list_cards_to_display_arr
  return
end

def display_loss_msg
  prompt "Someone Lost!"
end

def busted? potential_scores
  p potential_scores
  potential_scores.all? do |score|
    score > 21
  end
end

def hit_again?
  loop do
    prompt "Shall I hit you again?(y/n)"
    response = gets.chomp.downcase
    return true   if response == "y"
    return false  if response == "n"
    prompt "I didn't understand your input, please try again..."
  end
end

def hit! person_to_receive_card, card_drawn, dealer_hand, player_hand
  if person_to_receive_card == "player"
    player_hand << card_drawn
  elsif person_to_receive_card == "dealer"
    dealer_hand << card_drawn
  else
    puts "SOMETHING WENT WRONG!"
  end
  return
end

def app
  deck = fresh_deck()

  arr_of_turns = ["player"]
  # dealer_hand = [:five_of_hearts, :seven_of_spades, :two_of_spades]
  # player_hand = [:two_of_spades, :ace_of_diamonds, :three_of_hearts, :ace_of_spades]

  dealer_hand = []
  player_hand = []

  # 4.times do
  #   hit!(player_to_receive_card, dealer_draw_card!(deck), dealer_hand, player_hand)
  # end

  initial_4_card_deal = ["player", "dealer", "player", "dealer"]
  initial_4_card_deal.each do |person_to_receive_card|
    arr_of_turns << person_to_receive_card
    hit!(person_to_receive_card, dealer_draw_card!(deck), dealer_hand, player_hand)
  end


  # hit!("human", dealer_draw_card!(deck), dealer_hand, player_hand)
  # player_to_receive_card << "dealer"

  dealer_potential_scores = []
  player_potential_scores = []

  loop do #Player's Turn
    dealer_potential_scores.clear
    player_potential_scores.clear
    calculate_potential_hand_scores!(dealer_hand, dealer_potential_scores)
    calculate_potential_hand_scores!(player_hand, player_potential_scores)

    display_hand(hand = player_hand, person_is_dealer = false, must_hide_one_card = false)
    if busted?(player_potential_scores) then display_loss_msg() ; return end

    if hit_again?
      hit!("player", dealer_draw_card!(deck), dealer_hand, player_hand)
      next
    else
      prompt "That's all for now!"
      return
    end
  end

  calculate_potential_hand_scores!(dealer_hand, dealer_potential_scores)
  display_hand(hand = dealer_hand, person_is_dealer = true, must_hide_one_card = false)


game_over = "game over"
p game_over
end

app()
