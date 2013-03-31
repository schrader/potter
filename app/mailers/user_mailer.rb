class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.invitation.subject
  #
  def invite(invitation)
    @invitation = invitation
    @link = accept_invitations_url(@invitation.pot, token: @invitation.token)
    mail to: @invitation.email, subject: "Einladung zu einem gemeinsamen Pott pure awesomeness"
  end
end
