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

def add_card_to_hand! player_to_receive_card, card_drawn, dealer_hand, player_hand
  if player_to_receive_card.last == "human"
    player_hand << card_drawn
    player_to_receive_card << "dealer"
  elsif player_to_receive_card.last == "dealer"
    dealer_hand << card_drawn
    player_to_receive_card << "human"
  end
  return
end

def calculate_potential_hand_scores! hand, person_potential_scores
  number_of_aces = hand.select{|card| VALUE_OF_CARD[card].length == 2}.length

  if number_of_aces > 0
    p "end"
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

    p hand_without_aces = hand.reject{|card| VALUE_OF_CARD[card].length == 2}
    p hand_without_aces_numbers = hand_without_aces.map{|card| VALUE_OF_CARD[card][0]}

    p combos_aces_and_others = hand_without_aces_numbers.product(potential_ace_values)
    p values = combos_aces_and_others.map(&:sum).sort
    values.each{|value| person_potential_scores << value}
  elsif number_of_aces == 0
    potential_score = hand.map{|card| VALUE_OF_CARD[card][0]}.sum
    person_potential_scores << potential_score
  else
  end
  return
end

def app
  deck = fresh_deck()

  player_to_receive_card = ["human"]
  # dealer_hand = [:five_of_hearts, :seven_of_spades, :two_of_spades]
  # player_hand = [:two_of_spades, :ace_of_diamonds, :three_of_hearts, :ace_of_spades]

  dealer_hand = []
  player_hand = []

  4.times do
    add_card_to_hand!(player_to_receive_card, dealer_draw_card!(deck), dealer_hand, player_hand)
  end

  dealer_potential_scores = []
  player_potential_scores = []

  calculate_potential_hand_scores!(dealer_hand, dealer_potential_scores)
  calculate_potential_hand_scores!(player_hand, player_potential_scores)

  #tighten this up in helper method, logic for listing multiple cards...
  # prompt "Dealer has #{dealer_hand[0].to_s} and unknown card"
  # prompt "You have: #{player_hand[0].to_s} and #{player_hand[1].to_s}"


game_over = "game over"
p game_over
end

app()
