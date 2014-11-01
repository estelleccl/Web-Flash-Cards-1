class Round < ActiveRecord::Base
#   validates :user_id, :num_of_tries_left, presence: true
#   validates :num_of_tries_left, default: 3
  has_many :guesses
  has_many :cards, through: :guesses
  belongs_to :user
  belongs_to :deck

end