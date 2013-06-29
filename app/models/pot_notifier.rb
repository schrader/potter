class PotNotifier < Struct.new(:pot, :new_member)
  def announce_new_member

    self.pot.users.each do |user|
      PotMailer.announce_new_member(user, self.pot, self.new_member).deliver unless user == new_member
    end
  end
end