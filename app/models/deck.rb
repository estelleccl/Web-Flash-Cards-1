class Deck < ActiveRecord::Base
  # e.g., User.authenticate('josh@codedivision.com', 'apples123')
  validates_uniqueness_of :title
  validates :title, presence: true
  has_many :cards
end
