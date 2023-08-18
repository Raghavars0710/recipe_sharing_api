class User < ApplicationRecord
  has_secure_password

  enum role: { customer: 0, admin: 1}
  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :username, presence: true, uniqueness: true
  validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
  validates :role, inclusion: { in: roles.keys }

  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
