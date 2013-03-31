class Invitation < ActiveRecord::Base
  belongs_to :pot
  belongs_to :user
  before_validation :generate_token, on: :create
  validates :user, :pot, :token, :email, presence: true
  
  def user_is_already_member?
  end
  
  def accept!(invited_user)
    @invited_user = invited_user
    if pot.users.include?(user)
      if add_user_to_pot(invited_user)
        track_subscription
        destroy
        return true
      end
    end
    false
  end

  private

  def track_subscription
    self.pot.create_activity key: "pot.new_member", owner: @invited_user
  end

  def add_user_to_pot
    pot.users << @invited_user
    pot.save
  end

  def generate_token
    begin
      self.token = SecureRandom.hex
    end while self.class.exists?(token: token)
  end
end
