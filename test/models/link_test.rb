require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test ".markoff sets sent_at to current time for the collection of links" do
    Timecop.freeze
    create_list(:link, 3, user: build_stubbed(:user), pot: build_stubbed(:pot))

    Link.markoff
    
    assert_equal Link.where(sent_at: Time.now).count, 3
  end

  test "#sent returns true if Link got already sent" do
    assert Link.new(sent_at: Time.now).sent?
  end

  test "#sent returns false if link got not sent yet" do
    assert_not Link.new.sent?
  end
end