class Card < ActiveRecord::Base
  belongs_to :deck

  def answer_correct?(user_answer) #takes the user's text input
    self.answer == user_answer #will return true or false
  end

end
