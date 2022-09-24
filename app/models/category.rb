# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :description, length: { max_length: 250 }, if: -> { description.present? }
end
