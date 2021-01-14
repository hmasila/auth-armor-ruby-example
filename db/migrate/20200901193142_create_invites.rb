class CreateInvites < ActiveRecord::Migration[6.0]
  def change
    create_table :invites do |t|
      t.string :nickname, null: false
      t.string :username, null: false
      t.datetime :expires_at

      t.timestamps
    end
  end
end
