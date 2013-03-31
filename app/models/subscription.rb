class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :pot
  
  validates :user, uniqueness: {scope: :pot}
end
