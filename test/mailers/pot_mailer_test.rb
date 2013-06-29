require 'test_helper'
 
class PotMailerTest < ActionMailer::TestCase
  tests PotMailer

  test "#weekly" do
    @stubbed_pot = build_stubbed(:pot)
    @stubbed_user = build_stubbed(:user)

    email = PotMailer.weekly(@stubbed_pot, @stubbed_user).deliver

    assert !ActionMailer::Base.deliveries.empty?
  end

  test "#announce_new_member" do
    @stubbed_pot = build_stubbed(:pot)
    @stubbed_old_member = build_stubbed(:user)
    @stubbed_new_member = build_stubbed(:user)

    email = PotMailer.announce_new_member(@stubbed_old_member, @stubbed_pot, @stubbed_new_member).deliver

    assert !ActionMailer::Base.deliveries.empty?
  end
end