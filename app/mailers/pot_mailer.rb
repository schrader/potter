class PotMailer < ActionMailer::Base
  default from: "hedwig@sophisticates.de"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.pot_mailer.weekly.subject
  #
  def weekly(pot, user)
    @potname = pot.name
    @links_grouped_by_hottiness = Link.all.order("hottiness DESC").group_by(&:hottiness)
    @username = user.name

    mail to: user.email, subject: "#{@potname}: #{l(Date.today, format: :short)}"
  end
end
