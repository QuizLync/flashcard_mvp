class Deck < ActiveRecord::Base
  has_many :cards

  def select_card #on deck object
    @card = self.cards.sample #takes a random card
  end

  def answer_correct?(card, user_answer) #takes the user's text input
    @card = card
    @user_answer = user_answer
    @card.answer == @user_answer #will return true or false
  end

end

