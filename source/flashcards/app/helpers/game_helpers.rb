 helpers do 

  def check_answer 

    all_decks = Deck.all

    #gets the Deck id that the Card belongs to.
    all_decks.each do |deck_object|
      deck_object.cards.each do |card_object|
        if card_object.id == @card.id
          @deck = deck_object
        end
      end
    end

    if @card.answer_correct?(@user_answer)
      redirect "/decks/#{@deck.id}"
    else
      @incorrect = true
      erb :card
    end

  end
end




