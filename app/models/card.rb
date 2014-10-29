class Card < ActiveRecord::Base
  validates :deck_id, :question, :answer, presence: true
  belongs_to :deck
end