class Deck < ActiveRecord::Base
  has_many :cards

  def select_card #on deck object
    @card = self.cards.sample #takes a random card
  end


end


