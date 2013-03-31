class CreatePots < ActiveRecord::Migration
  def change
    create_table :pots do |t|
      t.string :name
      t.string :delivery_day, default: "sunday"
      t.integer :delivery_hour, default: 10

      t.timestamps
    end
  end
end
