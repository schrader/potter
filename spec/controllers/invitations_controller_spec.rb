require 'spec_helper'

describe InvitationsController do
  login_user

  describe "POST #create" do
    it "invites user and redirects to invitation's pot" do
      Pot.stub(:find).and_return(build_stubbed(:pot, id: 42))
      InvitationNotifier.any_instance.should_receive(:notify).exactly(1)

      post :create, {invitation: {email: "mail@example.com"}, pot_id: 42}
      response.should redirect_to(pot_path(42))
    end
  end

  describe "GET #accept" do
    it "accepts invitation and redirects to invitation's pot" do
      @invitations_pot = build_stubbed(:pot, id: 42)
      Invitation.stub(:find_by_token).and_return(build_stubbed(:invitation, pot: @invitations_pot))
      Invitation.any_instance.should_receive(:accept!).exactly(1).and_return(true)

      get :accept, {pot_id: @invitations_pot.id}

      response.should redirect_to(pot_path(@invitations_pot))
    end
  end
end