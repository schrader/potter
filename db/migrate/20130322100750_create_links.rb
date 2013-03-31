class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :name
      t.string :url, null: false
      t.references :user
      t.references :pot
      t.index :user_id
      t.index :pot_id
      t.datetime :sent_at
      t.text :description
      t.string :category
      t.integer :hottiness, default: 2
      
      t.timestamps
    end
  end
end
