require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  test "it generates a token on #create" do
    inv = Invitation.create
    assert inv.token.is_a?(String)
    assert_not inv.token.empty?
  end

  test "#accept! adds user to invitation's pot, destroys itself and returns true" do
    @pot = create(:pot)
    @issuer = create(:user)
    @issuer.update_attribute(:pots, [@pot])
    @invited_user = create(:user, email: "invited_user@example.com")

    inv = create(:invitation, issuer: @issuer, pot: @pot, email: "invited_user@example.com")
  
    assert inv.accept!(@invited_user)
    assert @pot.users.includes(@invited_user)
    assert inv.destroyed?
  end
end