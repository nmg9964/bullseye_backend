class Administrator < ApplicationRecord
  has_many :events
  has_secure_password
  validates :username, uniqueness: true
end
