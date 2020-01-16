class Administrator < ApplicationRecord
  has_many :events
  has_secure_password
  validates_presence_of :username, :password_digest, :email_address
  validates :username, uniqueness: true
end
