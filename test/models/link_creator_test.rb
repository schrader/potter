require "test_helper"

class LinkCreatorTest < ActiveSupport::TestCase
  test "saves link for each pot" do
    pots = create_list(:pot, 2)
    link_creator = LinkCreator.new(attributes_for(:link, pot: nil, user: create(:user)).merge(pot_ids: pots.map(&:id)))

    assert link_creator.save, link_creator.errors.inspect

    pots.each do |pot|
      assert_equal 1, pot.links.count
    end
  end

  test "pot_ids returns ids of @pots and @pot_ids, removing dublicates" do
    link_creator = LinkCreator.new
    stubbed_pots = build_stubbed_list(:pot, 4)
    link_creator.pots = stubbed_pots
    link_creator.pot_ids = [*1..10] + stubbed_pots.map(&:id)

    assert_equal link_creator.pot_ids.sort, ([*1..10] + stubbed_pots.map(&:id)).uniq.sort
  end
end