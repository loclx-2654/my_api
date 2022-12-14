# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :user_name, null: false
      t.string :email, null: false, unique: true
      t.string :encrypted_password, null: false
      t.string   :reset_password_token, unique: true
      t.datetime :reset_password_sent_at
      t.timestamps
    end
  end
end
