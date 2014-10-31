class Guess < ActiveRecord::Base
  validates :round_id, :card_id, presence: true
  validates_uniqueness_of :card_id, :scope => :round_id
  belongs_to :card
  belongs_to :round
end