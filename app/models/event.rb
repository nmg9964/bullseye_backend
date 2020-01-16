class Event < ApplicationRecord
  belongs_to :administrator
  validates_presence_of :date, :time, :first_name, :last_name, :phone_number, :email_address, :guest_count, :administrator_id
end
