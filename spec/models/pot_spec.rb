require 'spec_helper'

describe Pot do
  describe "#markoff_new_links" do
    it "marks off newlinks" do
      @new_links = double("Pot's new links")
      @new_links.should_receive(:markoff)

      Pot.any_instance.stub(:new_links).and_return(@new_links)

      Pot.new.markoff_new_links
    end
  end

  describe "#next_delivery_date" do
    it "returns next delivery's date" do
      pot = Pot.new(delivery_day: 'monday', delivery_hour: 4)
      pot.next_delivery_date.should eq(Chronic.parse("next monday at 4 AM"))
    end
  end
end
