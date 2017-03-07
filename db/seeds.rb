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
  email: "ruben@gmail.com",
  password: "rosebud",
  password_confirmation: "rosebud",
  first_name: "Ruben",
  last_name: "Frommanresa",
  phone: "0909090909",
  #photo_url: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAhQAAAAJDFlZjZmZmYwLWQ5ZTgtNDc1ZS1iNzM1LWJmZmQ3Mjc5OWE2Yw.jpg"
  })

jackie = User.new({
  email: "jackie-kennedy@kennedy.com",
  password: "rosebud",
  password_confirmation: "rosebud",
  first_name: "Jackie",
  last_name: "Kennedy",
  phone: "0908076532",
  #photo_url: "https://i.ytimg.com/vi/Hv5Q1EL-4pQ/maxresdefault.jpg"
  })

jeanjacques = User.new({
  email: "jeanjakie@gmail.com",
  password: "rosebud",
  password_confirmation: "rosebud",
  first_name: "Jean-Jacques",
  last_name: "Rousseau",
  phone: "09080787632",
  #photo_url: "http://www.sarahbeaucheminwriter.com/wp-content/uploads/2014/11/rousseau.jpg"
  })

ruben.save
jackie.save
jeanjacques.save

puts ruben.attributes
puts jeanjacques.attributes
puts jackie.attributes

# participant
joe = User.new({
  email: "joel@gmail.com",
  password: "rosebud",
  password_confirmation: "rosebud",
  first_name: "Joe",
  last_name: "Froogy"
  })

jimmy = User.new({
  email: "jimmy@gmail.com",
  password: "rosebud",
  password_confirmation: "rosebud",
  first_name: "Jimmy",
  last_name: "Ballon"
  })

julia = User.new({
  email: "julia@gmail.com",
  password: "rosebud",
  password_confirmation: "rosebud",
  first_name: "Julia",
  last_name: "Roberts"
  })

joe.save
julia.save
jimmy.save

puts joe.attributes
puts julia.attributes
puts jimmy.attributes

puppy_feeding = Event.new({
  name: "Puppy feeding",
  organizer_id: ruben.id,
  start_time: DateTime.strptime("19:00 25/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 25/03/2017", "%H:%M %d/%m/%Y"),
  address: "The Shelter, 3 calle Princesa 08001 Barcelona",
  capacity: 8,
  description: "Help us feeding puppies at Barcelona shelter!",
  #photo_url: "http://s3.amazonaws.com/assets.prod.vetstreet.com/36/57/b54c6efb461ba404656741ea0722/puppy-raisers-janet-keeler-fawn.jpg"
  })

teaching_refugees_english = Event.new({
  name: "Teach refugees english",
  organizer_id: jackie.id,
  start_time: DateTime.strptime("19:00 25/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 25/03/2017", "%H:%M %d/%m/%Y"),
  address: "The Shelter, 3 calle Princesa 08001 Barcelona",
  capacity: 8,
  description: "No specific skills required, just a desire to help and a friendly smile",
  #photo_url: "http://teachforall.org/sites/default/files/styles/news_network_learning_node_image/public/Storify%20news%20post.jpg?itok=sk0N5lWf"
  })

beach_cleaning = Event.new({
  name: "let's clean the beach!",
  organizer_id: jeanjacques.id,
  start_time: DateTime.strptime("19:00 25/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 25/03/2017", "%H:%M %d/%m/%Y"),
  address: "Playa de Barceloneta, 08001 Barcelona",
  capacity: 15,
  description: "Let's work together for a nicer beach :)",
  #photo_url: "http://www.editorial.sg/wp-content/uploads/17THBEACH_116636f.jpg"
  })

nursing_home = Event.new({
  name: "",
  organizer_id: jeanjacques.id,
  start_time: DateTime.strptime("19:00 25/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 25/03/2017", "%H:%M %d/%m/%Y"),
  address: "Paradise Nursing Home, calle Sardenya, 08765 Manresa",
  capacity: 5,
  description: "Come for a chat and share a meal with our residents",
  #photo_url: "http://teensgotcents.com/wp-content/uploads/2014/08/nursinghome1-1024x766.jpg"
  })

puppy_feeding.save
teaching_refugees_english.save
beach_cleaning.save
nursing_home.save




registration_one = Registration.new({
  participant_id: joe.id,
  event_id: nursing_home.id
  })

registration_two = Registration.new({
  participant_id: joe.id,
  event_id: beach_cleaning.id
  })

registration_three = Registration.new({
  participant_id: julia.id,
  event_id: nursing_home.id
  })

registration_for = Registration.new({
  participant_id: julia.id,
  event_id: puppy_feeding.id
  })

registration_five = Registration.new({
  participant_id: jimmy.id,
  event_id: puppy_feeding.id
  })

registration_six = Registration.new({
  participant_id: jimmy.id,
  event_id: teaching_refugees_english.id
  })


registration_seven = Registration.new({
  participant_id: julia.id,
  event_id: teaching_refugees_english.id
  })

registration_eight = Registration.new({
  participant_id: jimmy.id,
  event_id: beach_cleaning.id
  })


registration_one.save
registration_two.save
registration_three.save
registration_for.save
registration_five.save
registration_six.save
registration_seven.save
registration_eight.save


puts "///////////////////"



