class Card < ActiveRecord::Base
  validates :deck_id, :question, :answer, presence: true
  belongs_to :deck
  
  def self.check_answer(card_id,answer)
    card = self.find_by(id: card_id)
    if card.answer = answer
      return true
    else
      return false
    end   
  end
end