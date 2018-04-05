require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'
require './lib/guess'
require 'pry'

class GuessTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_instance_of Guess, guess
  end

  def test_it_has_card_to_guess
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    assert_equal card, guess.card
  end

  def test_response_from_guess
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    expected = "Juneau"
    assert_equal expected, guess.response
  end

  def test_is_it_the_correct_answer
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert guess.correct?
  end

  def test_it_gives_feedback
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)
    expected = "Correct!"
    assert_equal expected, guess.feedback
  end

  def test_it_has_other_new_card

    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    assert_equal card, guess.card
  end

  def test_response_from_guess
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)
    expected = "Saturn"
    assert_equal expected, guess.response
  end

  def test_is_it_the_correct_answer
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Which planet is closest to the sun?", "Mercury")
    guess1 = Guess.new("Juneau", card_1)
    guess2 = Guess.new("Saturn", card_2)

    assert guess1.correct?
    refute guess2.correct?
  end

  def test_it_gives_feedback
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Which planet is closest to the sun?", "Mercury")
    guess1 = Guess.new("Juneau", card_1)
    expected = "Correct!"
    assert_equal expected, guess1.feedback

    guess2 = Guess.new("Saturn", card_2)
    expected = "Incorrect"
    assert_equal expected, guess2.feedback
  end

end
