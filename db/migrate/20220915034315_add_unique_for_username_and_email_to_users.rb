# frozen_string_literal: true

class AddUniqueForUsernameAndEmailToUsers < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :user_name, unique: true
    add_index :users, :email, unique: true
  end
end
