require 'tod'
# test = Tod::TimeOfDay.new(8)
# p test.to_formatted_s


Administrator.create(username: 'navganj', password: 'password', email_address: 'navganj@gmail.com')

Event.create(first_name: 'Zayd', last_name: 'First', date: Date.new(2005, 05, 06), time: Tod::TimeOfDay.new(20).to_formatted_s, administrator_id: 1)
Event.create(first_name: 'Amr', last_name: 'Second', date: Date.new(2020, 01, 15), time: Tod::TimeOfDay.new(12).to_formatted_s, administrator_id: 1)
Event.create(first_name: 'Hind', last_name: 'Third', date: Date.new(2020, 01, 15), time: Tod::TimeOfDay.new(15).to_formatted_s, administrator_id: 1)
