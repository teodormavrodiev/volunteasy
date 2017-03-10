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
  photo_url: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAhQAAAAJDFlZjZmZmYwLWQ5ZTgtNDc1ZS1iNzM1LWJmZmQ3Mjc5OWE2Yw.jpg"
  })

jackie = User.new({
  email: "jackie-kennedy@kennedy.com",
  password: "rosebud",
  password_confirmation: "rosebud",
  first_name: "Jackie",
  last_name: "Kennedy",
  phone: "0908076532",
  photo_url: "https://i.ytimg.com/vi/Hv5Q1EL-4pQ/maxresdefault.jpg"
  })

jeanjacques = User.new({
  email: "jeanjakie@gmail.com",
  password: "rosebud",
  password_confirmation: "rosebud",
  first_name: "Jean-Jacques",
  last_name: "Rousseau",
  phone: "09080787632",
  photo_url: "http://www.sarahbeaucheminwriter.com/wp-content/uploads/2014/11/rousseau.jpg"
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
  start_time: DateTime.strptime("19:00 10/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 10/03/2017", "%H:%M %d/%m/%Y"),
  address: "The Shelter, 3 calle Princesa 08001 Barcelona",
  capacity: 8,
  description: "Help us feeding puppies at Barcelona shelter!",
  tags: ["Animals"],
  photo_urls: [
    "http://s3.amazonaws.com/assets.prod.vetstreet.com/36/57/b54c6efb461ba404656741ea0722/puppy-raisers-janet-keeler-fawn.jpg"
  ]
  })


teaching_refugees_spanish = Event.new({
  name: "Teach refugees spanish",
  organizer_id: jackie.id,
  start_time: DateTime.strptime("19:00 01/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 01/03/2017", "%H:%M %d/%m/%Y"),
  address: "The Bibi Bar, 3 calle Princesa 08001 Barcelona",
  capacity: 8,
  description: "No specific skills required, just a desire to help and a friendly smile",
  tags: ["Education"],
  photo_urls: [
    "http://teachforall.org/sites/default/files/styles/news_network_learning_node_image/public/Storify%20news%20post.jpg?itok=sk0N5lWf"
  ]
  })

teaching_refugees_english = Event.new({
  name: "Teach refugees english",
  organizer_id: jackie.id,
  start_time: DateTime.strptime("19:00 19/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 19/03/2017", "%H:%M %d/%m/%Y"),
  address: "The Bibi Bar, 3 calle Princesa 08001 Barcelona",
  capacity: 8,
  description: "No specific skills required, just a desire to help and a friendly smile",
  tags: ["Education"],
  photo_urls: [
    "http://teachforall.org/sites/default/files/styles/news_network_learning_node_image/public/Storify%20news%20post.jpg?itok=sk0N5lWf"
  ]
  })

beach_cleaning = Event.new({
  name: "let's clean the beach!",
  organizer_id: jeanjacques.id,
  start_time: DateTime.strptime("19:00 20/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 20/03/2017", "%H:%M %d/%m/%Y"),
  address: "Playa de Barceloneta, 08001 Barcelona",
  capacity: 15,
  description: "Let's work together for a nicer beach :)",
  tags: ["Animals", "Environment"],
  photo_urls: [
    "http://www.editorial.sg/wp-content/uploads/17THBEACH_116636f.jpg"
  ]
  })

nursing_home = Event.new({
  name: "Cup of tea at the Nursing Home",
  organizer_id: jeanjacques.id,
  start_time: DateTime.strptime("19:00 16/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 16/03/2017", "%H:%M %d/%m/%Y"),
  address: "Paradise Nursing Home, calle Sardenya, 08765 Manresa",
  capacity: 5,
  description: "Come for a chat and share a meal with our residents",
  tags: ["Seniors", "People with disabilities"],
  photo_urls:[
    "http://teensgotcents.com/wp-content/uploads/2014/08/nursinghome1-1024x766.jpg"
  ]
  })

plant_trees = Event.new({
  name: "Help save local forest",
  organizer_id: jeanjacques.id,
  start_time: DateTime.strptime("19:00 08/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 08/03/2017", "%H:%M %d/%m/%Y"),
  address: "Selva de Montseny, 08766 Monseny",
  capacity: 5,
  description: "We'll plant trees and discuss about local initiatives",
  tags: ["Environment"],
  photo_urls: [
    "http://teensgotcents.com/wp-content/uploads/2014/08/nursinghome1-1024x766.jpg"
  ]
  })

sewing = Event.new({
  name: "Activity volunteer - sewing",
  organizer_id: jackie.id,
  start_time: DateTime.strptime("19:00 10/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 10/03/2017", "%H:%M %d/%m/%Y"),
  address: "3 calle de la Flor, 08766 Madrid",
  capacity: 14,
  description: "We partner with individuals ages 60+ to foster community connections and improve quality of life.",
  tags: ["Community"],
  photo_urls: [
    "http://teensgotcents.com/wp-content/uploads/2014/08/nursinghome1-1024x766.jpg"
  ]
  })

business = Event.new({
  name: "Share your knowledge with a small business owner",
  organizer_id: jackie.id,
  start_time: DateTime.strptime("19:00 15/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 15/03/2017", "%H:%M %d/%m/%Y"),
  address: "3 calle de Catalunya, 08766 Madrid",
  capacity: 14,
  description: "Volunteer as a mentor on MicroMentor.org and make a meaningful connection with a business owner. ",
  tags: ["Community"],
  photo_urls: [
    "http://teensgotcents.com/wp-content/uploads/2014/08/nursinghome1-1024x766.jpg"
  ]
  })

puppy_feeding.save
teaching_refugees_english.save
teaching_refugees_spanish.save
beach_cleaning.save
nursing_home.save
plant_trees.save
sewing.save
business.save




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


registration_nine = Registration.new({
  participant_id: julia.id,
  event_id: plant_trees.id
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



