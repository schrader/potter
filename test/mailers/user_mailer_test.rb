require 'test_helper'
 
class UserMailerTest < ActionMailer::TestCase
  tests UserMailer

  test "#invite" do
    @stubbed_invitation = stub(email: 'mail@chrisschell.de', pot_name: "bla", issuer_name: "Max", token: 123)

    email = UserMailer.invite(@stubbed_invitation).deliver

    assert !ActionMailer::Base.deliveries.empty?
  end
end