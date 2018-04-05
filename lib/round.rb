
class Round

  attr_reader :deck,
              :guesses,
              :round


  def initialize(deck)
    @deck = deck
    @guesses = []
    @index = 0
  end

  def current_card
     @deck.cards[@index]
  end

  def record_guess(response, current_card)
    # binding.pry
    @guesses << Guess.new(response, current_card)
    @guesses.last
    # @guesses
  end


end
