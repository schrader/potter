require 'test_helper'

class InvitationNotifierTest < ActiveSupport::TestCase
  test "#notify sends an email" do
    UserMailer.expects(:invite).with(instance_of(Invitation)).returns(stub(deliver: true))
      
    InvitationNotifier.new(Invitation.new).send_invitation
  end
end