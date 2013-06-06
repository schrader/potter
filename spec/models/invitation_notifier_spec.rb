require 'spec_helper'

describe InvitationNotifier do
  describe "#notify" do
    it "sends an email" do
      UserMailer.should_receive(:invite).with(instance_of(Invitation)).and_return(OpenStruct.new(deliver: true))
      
      InvitationNotifier.new(Invitation.new).notify
    end
  end
end
