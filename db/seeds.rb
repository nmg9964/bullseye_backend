# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Administrator.create(username: 'navganj', password: 'password', email_address: 'navganj@gmail.com')

Event.create(first_name: 'Zayd', last_name: 'Awwal', date: Date.new(2005, 05, 06), administrator_id: 1)
Event.create(first_name: 'Amr', last_name: 'Thani', date: Date.new(2020, 01, 15), administrator_id: 1)
