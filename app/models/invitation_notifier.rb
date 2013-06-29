InvitationNotifier = Struct.new(:invitation) do
  def send_invitation
    UserMailer.invite(invitation).deliver    
  end
end