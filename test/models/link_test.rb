require 'test_helper'

class LinkTest < ActiveSupport::TestCase
  test ".markoff sets sent_at to current time for the collection of links" do
    Timecop.freeze
    Link.expects(:update_all).with(sent_at: Time.zone.now)
    Link.markoff
  end

  test "#sent returns true if Link got already sent" do
    assert Link.new(sent_at: Time.now).sent?
  end

  test "#sent returns false if link got not sent yet" do
    assert_not Link.new.sent?
  end
end