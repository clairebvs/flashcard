require 'minitest/autorun'
require 'minitest/pride'
require './lib/card'

class CardTest < Minitest::Test

  def test_it_exists
    card = Card.new("What is the capital of Alaska?", "Juneau")

    assert_instance_of Card, card
  end

  def test_card_has_a_question_and_answer
    card = Card.new("What is the capital of Alaska?", "Juneau")

    expected = "What is the capital of Alaska?"
    assert_equal expected, card.question

    expected = "Juneau"
    assert_equal expected, card.answer
  end

end
