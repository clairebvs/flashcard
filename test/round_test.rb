require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/deck'
require './lib/guess'
require './lib/round'
require 'pry'

class RoundTest < Minitest::Test

  def test_it_exists
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_instance_of Round, round
  end

  def test_new_deck_of_cards_for_round
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal deck, round.deck
  end

  def test_guesses_is_an_empty_array
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    expected = []

    assert_equal expected, round.guesses
  end

  def test_we_have_a_current_card_to_play
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)

    assert_equal card_1, round.current_card
  end

  def test_record_the_guess
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    guess = Guess.new("Juneau", card_1)
    round = Round.new(deck)

    assert_instance_of Guess, guess
    assert_equal "Juneau", guess.response
  end

  def test_count_the_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    response = "response"
    guess = Guess.new(card_1, response)
    binding.pry
    round.record_guess(response, deck)

    assert_equal 1, round.guesses.count
  end

  def test_gives_feedback_for_first_guesses
    skip
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
    deck = Deck.new([card_1, card_2])
    round = Round.new(deck)
    expected = "Correct!"

    assert_equal expected, round.guesses.first.feedback
  end

end


# round.record_guess("Juneau")
# => #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @answer="Juneau", @question="What is the capital of Alaska?">, @response="Juneau">

# round.guesses.count
# => 1


# round.guesses.first.feedback
# => "Correct!"
# round.number_correct
# => 1
# round.current_card
# => #<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">
# round.record_guess("2")
# => #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">, @response="2">
# round.guesses.count
# => 2
# round.guesses.last.feedback
# => "Incorrect."
# round.number_correct
# => 1
# round.percent_correct
# => 50
