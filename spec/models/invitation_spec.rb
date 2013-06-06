require 'spec_helper'

describe Invitation do
  describe "#create" do
    it "generates token" do
      inv = Invitation.create
      inv.token.should be_a(String)
      inv.token.should_not be_empty
    end
  end

  describe "#accept!" do
    it "adds user to invitation's pot, destroys itself and returns true" do
      @pot = create(:pot)
      @issuer = create(:user)
      @issuer.update_attribute(:pots, [@pot])
      @invited_user = create(:user, email: "invited_user@example.com")

      inv = create(:invitation, issuer: @issuer, pot: @pot, email: "invited_user@example.com")
      
      inv.accept!(@invited_user).should be_true
      @pot.users.should include(@invited_user)
      inv.should be_destroyed
    end
  end
end