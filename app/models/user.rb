class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
  
  validates :name, presence: true
  
  has_many :links
  has_many :subscriptions
  has_many :pots, through: :subscriptions
end
