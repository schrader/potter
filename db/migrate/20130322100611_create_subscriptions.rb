class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :user
      t.references :pot
      t.index :user_id
      t.index :pot_id
      t.timestamps
    end
  end
end
