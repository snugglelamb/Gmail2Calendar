# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(account: 'cit597project@gmail.com', psw:'cit597penn', name: 'swap', json: 'client_secrets.json')
email = Email.create(eid: 0, user_id: user.id)
event = Event.create(name: 'flight',email_id: email.id)