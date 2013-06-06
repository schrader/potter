require 'spec_helper'

describe Link do
  describe ".markoff" do
    it "sets sent_at to current time for the collection of links" do
      Timecop.freeze
      Link.should_receive(:update_all).with(sent_at: Time.zone.now)
      Link.markoff
    end
  end
end
