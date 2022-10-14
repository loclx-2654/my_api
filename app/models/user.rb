# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password

  validates :password, confirmation: true, allow_nil: true
  validates :password_confirmation, presence: true, if: -> { password.present? }
  validates :user_name, presence: true, uniqueness: true
  validates :email, uniqueness: true, if: -> { email_changed? }
end
