class Guess < ActiveRecord::Base
  validates :round_id, :card_id, presence: true
  belongs_to :card
  belongs_to :round
end