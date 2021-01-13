# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name, null: false, default: ''
      t.string :last_name, null: false, default: ''
      t.string :email, null: false
      t.integer :age, null: false
      t.string :gender, null: true, default: ''
      t.timestamps
    end
  end
end
