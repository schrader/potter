class Invitation < ActiveRecord::Base
  belongs_to :pot
  belongs_to :issuer, foreign_key: :user_id, class_name: 'User'
  before_validation :generate_token, on: :create
  validates :issuer, :pot, :token, :email, presence: true
  
  def user_is_already_member?
  end
  
  def accept!(invited_user)
    return false unless invited_user.is_a?(User) && pot.users.include?(issuer)

    @invited_user = invited_user

    add_user_to_pot do
      track_subscription
      destroy
    end
    true
  end

  private

  def track_subscription
    self.pot.create_activity key: "pot.new_member", owner: @invited_user
  end

  def add_user_to_pot
    pot.users << @invited_user
    if pot.save!
      yield
    end
  end

  def generate_token
    begin
      self.token = SecureRandom.hex
    end while self.class.exists?(token: token)
  end
end
