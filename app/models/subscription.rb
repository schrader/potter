class Subscription < ActiveRecord::Base
  belongs_to :user, touch: true
  belongs_to :pot, touch: true
  
  validates :user, uniqueness: {scope: :pot}
end
