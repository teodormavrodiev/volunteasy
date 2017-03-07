# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# organizer
Registration.destroy_all
Event.destroy_all
User.destroy_all

ruben = User.new({
  email: "jamsbec@gmail.com",
  password: "rosebud",
  password_confirmation: "rosebud",
  first_name: "ruben",
  last_name: "waekfyg"
  })

ruben.save

puts ruben.attributes

# participant
joe = User.new({
  email: "asdfghjkl@gmail.com",
  password: "rosebud",
  password_confirmation: "rosebud",
  first_name: "joe",
  last_name: "awelfku"
  })

joe.save

puts joe.attributes

eve = Event.new({
  name: "puppy feeding",
  organizer_id: ruben.id
  })

eve.save

puts eve.attributes

reg = Registration.new({
  participant_id: joe.id,
  event_id: eve.id
  })

reg.save

puts reg.attributes

puts "///////////////////"

puts ruben.events.first.id

