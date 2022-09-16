class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  validates :password, confirmation: true, allow_nil: true
  validates :password_confirmation, presence: true, if: ->{password.present?}
  validates :user_name, presence: true, uniqueness: true
  validates :email, uniqueness: true, if: ->{email_changed?}
end
