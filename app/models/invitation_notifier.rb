InvitationNotifier = Struct.new(:invitation) do
  def notify
    UserMailer.invite(invitation).deliver    
  end
end