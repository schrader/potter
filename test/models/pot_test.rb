require 'test_helper'

class PotTest < ActiveSupport::TestCase
  test "#next_delivery_date returns next deliverys date" do
    pot = Pot.new(delivery_day: 'monday', delivery_hour: 4)
    assert_equal pot.next_delivery_date, Chronic.parse("next monday at 4 AM")
  end

  test "#markoff_new_links marks off new links" do
    @new_links = stub()
    @new_links.expects(:markoff)

    Pot.any_instance.stubs(:new_links).returns(@new_links)

    Pot.new.markoff_new_links
  end

  test "#new_members" do
    Timecop.travel(3.days.ago) do
      @pot = create(:pot, last_delivered_at: Time.zone.now)
      old_members = create_list(:user, 2)
      @pot.users << old_members
      @pot.save
    end

    @new_members = create_list(:user, 2)
    @pot.users << @new_members
    @pot.save

    assert_equal @pot.new_members, @new_members
  end
end