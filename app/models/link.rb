class Link < ActiveRecord::Base
  include PublicActivity::Common
  
  HOTTINESSES = {1 => "interesting for some of us", 2 => "interesting for everybody", 3 => "just. fucking. read. it."}
  
  belongs_to :pot, touch: true
  belongs_to :user
  
  scope :from_user, lambda {|user| where("user_id = ?", user.id)}
  scope :from_others_than, lambda {|user| where("user_id != ?", user.id)}
  scope :sent_directly_after, -> time { where(sent_at: where("sent_at >= ?", time.to_datetime).order("sent_at ASC").limit(1).pluck(:sent_at))}

  validates :user, presence: true
  # validates :pot, presence: true
  validates :hottiness, inclusion: {in: HOTTINESSES}
  
  def self.markoff
    self.update_all(sent_at: Time.zone.now)
  end
  
  def sent?
    self.sent_at.present?
  end

  def cached_user_name
    Rails.cache.fetch([self, "user_name"]) { user.name }
  end
end
