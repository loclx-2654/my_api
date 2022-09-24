# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.text :description
      t.string :image
      t.datetime :deleted_at, index: true
    end
  end
end
