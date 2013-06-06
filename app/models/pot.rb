  class Pot < ActiveRecord::Base
  include PublicActivity::Common
  
  has_many :links, -> {order created_at: :desc}
  has_many :old_links, -> {where("sent_at IS NOT ?", nil).order(created_at: :desc)}, class_name: "Link"
  has_many :new_links, -> {where("sent_at IS ?", nil).order(created_at: :desc)}, class_name: "Link"
  has_many :subscriptions
  has_many :users, through: :subscriptions
  
  
  WEEKDAYS = %w[monday tuesday wednesday thursday friday saturday sunday].freeze
  
  def markoff_new_links
    new_links.markoff
  end
  
  def next_delivery_date
    Chronic.parse("next #{delivery_day} at #{delivery_hour}")
  end
end
