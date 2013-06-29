class PotMailer < ActionMailer::Base
  default from: "hedwig@sophisticates.de"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pot_mailer.weekly.subject
  #
  def weekly(pot, user)
    @pot = pot
    @links_grouped_by_hottiness = pot.new_links.order("hottiness DESC").group_by(&:hottiness)
    @username = user.name

    mail to: user.email, subject: "#{@pot.name}: #{l(Date.today, format: :short)}"
  end

  def announce_new_member(receiver, pot, new_member)
    @pot = pot
    @pot.users.to_a # caching...
    @username = receiver.name
    @new_members_name = new_member.name
    
    mail to: receiver.email, subject: "Neues Mitglied in #{@pot.name}"
  end
end
