# TODO find better name
class LinkCreator < Link
  attr_writer :pot_ids
  attr_writer :pots

  def self.model_name
    Link.model_name
  end

  def create_record
    self.pot_ids.each do |pot_id|
      link = Link.new(self.attributes.merge(pot: Pot.find(pot_id)))
      unless link.save
        @errors = link.errors
        return false
      end
    end
    true
  end

  def pot_ids
    pot_ids = (@pot_ids.to_a + @pots.to_a.map(&:id)).uniq.reject(&:blank?)
  end
end