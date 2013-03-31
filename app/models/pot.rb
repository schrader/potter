class Pot < ActiveRecord::Base
  include PublicActivity::Common
  
  has_many :links, -> {order created_at: :desc}
  has_many :subscriptions
  has_many :users, through: :subscriptions
  
  # validates :users, presence: true
  
  WEEKDAYS = %w[monday tuesday wednesday thursday friday saturday sunday].freeze
  
  def markoff_links
    links.markoff
  end
  
  def next_delivery_date
    Chronic.parse("next #{delivery_day} at #{delivery_hour}")
  end
end
