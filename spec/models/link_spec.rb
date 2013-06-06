require 'spec_helper'

describe Link do
  describe ".markoff" do
    it "sets sent_at to current time for the collection of links" do
      Timecop.freeze
      Link.should_receive(:update_all).with(sent_at: Time.zone.now)
      Link.markoff
    end
  end

  describe "#sent?" do
    it "returns true if Link got already sent" do
      Link.new(sent_at: Time.now).should be_sent
    end

    it "returns false if Link got not sent yet" do
      Link.new.should_not be_sent
    end
  end
end
