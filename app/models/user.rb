class User < ActiveRecord::Base
  # e.g., User.authenticate('josh@codedivision.com', 'apples123')
  has_many :rounds
  
  validates_uniqueness_of :email
  validates :password, :email, :username, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  validates :username, length: { minimum: 5 }

  def self.authenticate(email, password)
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
    user = self.find_by email: email #find_by can't use count
    if !user.nil?
      if user.password == password
        return user
      end
    end
    return nil
  end
end
