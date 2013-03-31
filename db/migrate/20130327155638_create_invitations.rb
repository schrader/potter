class CreateInvitations < ActiveRecord::Migration
  def change
    create_table :invitations do |t|
      t.string :email
      t.string :token
      t.references :pot, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
