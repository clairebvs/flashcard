class Guess

  attr_reader :card,
              :response

  def initialize(response, card)
    @card = card
    @response = response
  end

  def correct?
     @response == @card.answer
  end

  def feedback
  if  correct?
      "Correct!"
    else
      "Incorrect"
    end
  end

end
