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
    it "adds user to invitation's pot" do
      @pot = create(:pot)
      @issuer = create(:user)
      
      @issuer.update_attribute(:pots, [@pot])

      @invited_user = create(:user, email: "invited_user@example.com")

      inv = create(:invitation, issuer: @issuer, pot: @pot, email: "invited_user@example.com")
      inv.accept!(@invited_user)

      @pot.users.should include(@invited_user)
    end
  end
end