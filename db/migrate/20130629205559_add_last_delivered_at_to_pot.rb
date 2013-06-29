class AddLastDeliveredAtToPot < ActiveRecord::Migration
  def change
    add_column :pots, :last_delivered_at, :datetime
  end
end
