require 'test_helper'

class InvitationsControllerTest < ActionController::TestCase
  def setup
    sign_in create(:user)
  end
  
  test "POST #create invites user and redirects to invitation's pot" do
    Pot.stubs(:find).returns(build_stubbed(:pot, id: 42))
    InvitationNotifier.any_instance.expects(:send_invitation).once

    post :create, {invitation: {email: "mail@example.com"}, pot_id: 42}
    
    assert_redirected_to pot_path(42)
  end

  test "GET #accept accepts invitation and redirects to invitation's pot" do
    @invitations_pot = build_stubbed(:pot, id: 42)
    Invitation.stubs(:find_by_token).returns(build_stubbed(:invitation, pot: @invitations_pot))
    Invitation.any_instance.expects(:accept!).once.returns(true)

    get :accept, {pot_id: @invitations_pot.id}

    assert_redirected_to pot_path(@invitations_pot)
  end
end
