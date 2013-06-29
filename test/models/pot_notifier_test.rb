require 'test_helper'

class PotNotifierTest < ActiveSupport::TestCase
  test "#announce_new_member sends an email to all potmembers" do
    @stubbed_pot = build_stubbed(:pot)
    @stubbed_old_members = build_stubbed_list(:user, 5, pots: [@stubbed_pot])
    @stubbed_new_member = build_stubbed(:user, pots: [@stubbed_pot])
    @stubbed_pot.users = [*@stubbed_old_members, @stubbed_new_member]

    PotMailer.expects(:announce_new_member).with(instance_of(User), @stubbed_pot, @stubbed_new_member).times(5).returns(stub(deliver: true))

    PotNotifier.new(@stubbed_pot, @stubbed_new_member).announce_new_member
  end
end