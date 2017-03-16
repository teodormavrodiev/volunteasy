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
  organization: "Help Orphan Puppies",
  phone: "0909090909",
  photo_url: "https://media.licdn.com/mpr/mpr/shrinknp_200_200/AAEAAQAAAAAAAAhQAAAAJDFlZjZmZmYwLWQ5ZTgtNDc1ZS1iNzM1LWJmZmQ3Mjc5OWE2Yw.jpg"
  })


johnny = User.new({
  email: "johnny@gmail.com",
  password: "rosebud",
  password_confirmation: "rosebud",
  first_name: "Johnny",
  last_name: "Deep",
  organization: "DailyHelp",
  phone: "0909090909",
  photo_url: "http://xewt12.com/wp-content/uploads/2016/02/johnny-depp-dior-vogue-3jun15-pr_b.jpg"
  })



jackie = User.new({
  email: "jackie-kennedy@kennedy.com",
  password: "rosebud",
  password_confirmation: "rosebud",
  first_name: "Jackie",
  last_name: "Kenny",
  organization: "nationalbreastcancer.org, Language Integration for Syrian Refugee Children",
  phone: "0908076532",
  bio: "I'm a famous tandem cycling lover who loves mechanics. I love Barcelona and want to make a difference in my community.",
  photo_url: "http://www.thefamouspeople.com/profiles/images/jackie-kennedy-21.jpg",
  })
jeanjacques = User.new({
  email: "jeanjakie@gmail.com",
  password: "rosebud",
  password_confirmation: "rosebud",
  organization: "Save Our Beach",
  first_name: "Jean-Jacques",
  last_name: "Rousseau",
  phone: "09080787632",
  photo_url: "http://www.sarahbeaucheminwriter.com/wp-content/uploads/2014/11/rousseau.jpg"
  })


alex = User.new({
  email: "alex-el-rider@gmail.com",
  password: "rosebud",
  password_confirmation: "rosebud",
  organization: "HolaBici Coalition",
  first_name: "Alex",
  last_name: "Fernandez",
  phone: "09080787632",
  bio: "Hi, my name is Alex and I'm a bici lover and manager at HolaBici.
  HolaBici is your community bicycle workshop and thrift store.
  HolaBici Coalition has been working to make Barcelona a great place to ride a bike for over 25 years. By working with City Administrators, Educators, and Planners, we’re putting el Raval on track so that bicycling is safe, accessible, and enjoyable for everyone.",
  photo_url: "http://res.cloudinary.com/demo/image/fetch/http://cdn.mos.cyclingnews.com/2016/03/24/2/bettini_catalunya_4-300-80.jpg"
  })


jane = User.new({
  email: "jane@gmail.com",
  password: "rosebud",
  password_confirmation: "rosebud",
  organization: "BCN Sandwich Run",
  first_name: "Jane",
  last_name: "Butterfly",
  phone: "09080787632",
  bio: "I have been involved in homeless street outreach for the last nine years, leading volunteer groups and individuals who want to meet and help the homeless where they live - out on the street, in shelters or drop-ins, and food banks.
The program I facilitate is called the 'Sandwich Run' which involves volunteers delivering nutritious bag lunches to homeless street people by walking well travelled routes in the downtown area of Toronto where street people live.",
  photo_url: "http://res.cloudinary.com/demo/image/fetch/https://s-media-cache-ak0.pinimg.com/originals/9f/71/12/9f71124b93343d50f68548af271a54db.jpg"
  })


james = User.new({
  email: "james@gmail.com",
  password: "james@gmail.com",
  password_confirmation: "james@gmail.com",
  organization: "El Refugio Barcelona",
  first_name: "James",
  last_name: "B",
  phone: "09080787632",
  bio: "I like to help others but it wasn't until i found Volunteasy that my life changed forever. Now i can help people whenever I want :) Most important : I love puppies.",
  photo_url: "https://avatars3.githubusercontent.com/u/5620278?v=3&s=400"
  })


alex.save
johnny.save
ruben.save
jackie.save
jane.save
james.save
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
  last_name: "Froogy",
  photo_url: "http://res.cloudinary.com/demo/image/fetch/http://cdn.mos.cyclingnews.com/2016/03/24/2/bettini_catalunya_4-300-80.jpg"  })
jimmy = User.new({
  email: "jimmy@gmail.com",
  password: "rosebud",
  password_confirmation: "rosebud",
  first_name: "Jimmy",
  last_name: "Ballon",
  photo_url: "http://res.cloudinary.com/demo/image/fetch/http://cdn.mos.cyclingnews.com/2016/03/24/2/bettini_catalunya_4-300-80.jpg"  })
julia = User.new({
  email: "julia@gmail.com",
  password: "rosebud",
  password_confirmation: "rosebud",
  first_name: "Julia",
  last_name: "Roberts",
  photo_url: "http://res.cloudinary.com/demo/image/fetch/https://s-media-cache-ak0.pinimg.com/originals/9f/71/12/9f71124b93343d50f68548af271a54db.jpg"
  })
mariah = User.new({
  email: "mariah@gmail.com",
  password: "rosebud",
  password_confirmation: "rosebud",
  first_name: "Mariah",
  last_name: "Triangle",
  photo_url: "http://www.billboard.com/files/styles/article_main_image/public/media/mariah-carey-july-2014-billboard-650.jpg"
  })

marina =  User.new({
  email: "marina@gmail.com",
  password: "rosebud",
  password_confirmation: "rosebud",
  first_name: "Marina",
  last_name: "Elpaso",
  bio: 'As a volunteer, I’ve learned that no matter how troubled our past, how despairing our present we all have one thing in common – our humanity. We are all struggling to survive and find our place in the world. I have learned how to be a support for others without getting bogged down by the pain of others.',
  photo_url: "http://ramblingmandie.com/wp-content/uploads/2014/09/girl-volunteering.jpg"
  })





mariah.save
joe.save
marina.save
julia.save
jimmy.save
puts joe.attributes
puts julia.attributes
puts jimmy.attributes
puppy_feeding = Event.new({
  name: "Puppy feeding",
  organizer_id: james.id,
  start_time: DateTime.strptime("19:00 10/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 10/03/2017", "%H:%M %d/%m/%Y"),
  address: "Refugi, Carrer Nou de la Rambla, 175, 08004 Barcelona",
  capacity: 8,
  description: "Help us feeding puppies at Barcelona shelter!",
  tags: ["Animals"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/http://s3.amazonaws.com/assets.prod.vetstreet.com/36/57/b54c6efb461ba404656741ea0722/puppy-raisers-janet-keeler-fawn.jpg"
  ]
  })


puppy_feeding2 = Event.new({
  name: "Help us take care of an orphaned litter of puppies",
  organizer_id: ruben.id,
  start_time: DateTime.strptime("14:00 13/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("18:00 13/03/2017", "%H:%M %d/%m/%Y"),
  address: "Refugi, Carrer Nou de la Rambla, 175, 08004 Barcelona",
  capacity: 8,
  description: "Help us feeding puppies at Barcelona shelter!",
  tags: ["Animals"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/http://s3.amazonaws.com/assets.prod.vetstreet.com/36/57/b54c6efb461ba404656741ea0722/puppy-raisers-janet-keeler-fawn.jpg"
  ]
  })

teaching_refugees_spanish = Event.new({
  name: "Teach refugees spanish",
  organizer_id: jackie.id,
  start_time: DateTime.strptime("19:00 19/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 19/03/2017", "%H:%M %d/%m/%Y"),
  address: "Centro del Estudio, Carrer de la Princesa, 08003 Barcelona",
  capacity: 8,
  description: "No specific skills required, just a desire to help and a friendly smile",
  tags: ["Education", "Crisis Support"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/http://teachforall.org/sites/default/files/styles/news_network_learning_node_image/public/Storify%20news%20post.jpg?itok=sk0N5lWf"
  ]
  })

teaching_refugees_spanish = Event.new({
  name: "Teach refugees spanish",
  organizer_id: jackie.id,
  start_time: DateTime.strptime("19:00 17/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 17/03/2017", "%H:%M %d/%m/%Y"),
  address: "Centro del Estudio, Carrer de la Princesa, 08003 Barcelona",
  capacity: 8,
  description: "No specific skills required, just a desire to help and a friendly smile",
  tags: ["Education", "Crisis Support"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/http://teachforall.org/sites/default/files/styles/news_network_learning_node_image/public/Storify%20news%20post.jpg?itok=sk0N5lWf",
  "http://res.cloudinary.com/demo/image/fetch/http://teachforall.org/sites/default/files/styles/news_network_learning_node_image/public/Storify%20news%20post.jpg?itok=sk0N5lWf"]
  })

teaching_refugees_english = Event.new({
  name: "Teach refugees english",
  organizer_id: jackie.id,
  start_time: DateTime.strptime("19:00 22/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 22/03/2017", "%H:%M %d/%m/%Y"),
  address: "Centro del Estudio, Carrer de la Princesa, 08003 Barcelona",
  capacity: 8,
  description: "No specific skills required, just a desire to help and a friendly smile",
  tags: ["Education", "Crisis Support"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/http://teachforall.org/sites/default/files/styles/news_network_learning_node_image/public/Storify%20news%20post.jpg?itok=sk0N5lWf"
  ]
  })
beach_cleaning = Event.new({
  name: "Let's clean the beach!",
  organizer_id: jeanjacques.id,
  start_time: DateTime.strptime("19:00 20/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 20/03/2017", "%H:%M %d/%m/%Y"),
  address: "Platja de la Barceloneta, 08003 Barcelone",
  capacity: 15,
  description: "Let's work together for a nicer beach :)",
  tags: ["Animals", "Environment"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/http://www.editorial.sg/wp-content/uploads/17THBEACH_116636f.jpg"
  ]
  })
nursing_home = Event.new({
  name: "Cup of tea at the Nursing Home",
  organizer_id: jeanjacques.id,
  start_time: DateTime.strptime("19:00 16/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 16/03/2017", "%H:%M %d/%m/%Y"),
  address: "Paradise Nursing Home, calle Sardenya, 08765 Barcelona",
  capacity: 5,
  description: "Come for a chat and share a meal with our residents",
  tags: ["Seniors", "People with disabilities"],
  photo_urls:[
    "http://res.cloudinary.com/demo/image/fetch/http://teensgotcents.com/wp-content/uploads/2014/08/nursinghome1-1024x766.jpg"
  ]
  })
plant_trees = Event.new({
  name: "Help save local forest",
  organizer_id: jeanjacques.id,
  start_time: DateTime.strptime("19:00 08/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 08/03/2017", "%H:%M %d/%m/%Y"),
  address: "Selva de Montseny, 08766 Barcelona",
  capacity: 5,
  description: "We'll plant trees and discuss about local initiatives",
  tags: ["Environment"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/http://news.valenciacollege.edu/files/2012/03/Tree-Campus-for-Home-Page-1851.jpg"
  ]
  })
sewing = Event.new({
  name: "Activity volunteer - sewing",
  organizer_id: jackie.id,
  start_time: DateTime.strptime("19:00 10/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 10/03/2017", "%H:%M %d/%m/%Y"),
  address: "3 calle de la Flor, 08766 Barcelona",
  capacity: 14,
  description: "We partner with individuals ages 60+ to foster community connections and improve quality of life.",
  tags: ["Community"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/http://extension.wsu.edu/snohomish/wp-content/uploads/sites/7/2012/11/sewing-mentor-mentee-396x262.jpg"
  ]
  })
business = Event.new({
  name: "Share your knowledge with a small business owner",
  organizer_id: jackie.id,
  start_time: DateTime.strptime("19:00 15/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 15/03/2017", "%H:%M %d/%m/%Y"),
  address: "3 calle de Catalunya, 08766 Barcelona",
  capacity: 14,
  description: "Volunteer as a mentor on MicroMentor.org and make a meaningful connection with a business owner. ",
  tags: ["Community"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/https://cdn2.goabroad.com/images/a/top/liz-2015-gocambio-ireland-php-994-hd-1455593945.jpg"
  ]
  })


bike = Event.new({
  name: "Volunteers needed at the BCN Ride Event!",
  organizer_id: jackie.id,
  start_time: DateTime.strptime("15:00 18/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("20:00 18/03/2017", "%H:%M %d/%m/%Y"),
  address: "Rambla del Raval, Barcelona",
  capacity: 15,
  description: "Raise money for breast cancer research! Volunteer at this exciting one day bike ride and raise money for for The Hepatitis C Trust! Volunteers are needed to help with things like set-up, check-in, food service, cheering, tear down and rest stops.",
  tags: ["Sports", "Health"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/https://farm6.staticflickr.com/5545/14306218244_892c83fe49.jpg"
  ]
  })


women = Event.new({
  name: "Go red for women's day",
  organizer_id: jackie.id,
  start_time: DateTime.strptime("10:00 08/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("15:00 08/03/2017", "%H:%M %d/%m/%Y"),
  address: "Passeig de Santa Madrona, s/n, 08038 Barcelona",
  capacity: 20,
  description: "Help the Spanish Heart Association Go Red For Women Event. The duties will vary from set up, greeting, silent auction help, decorating, etc.",
  tags: ["Women", "Community"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/http://www.gundersenhealth.org/app/files/public/5237/Boscobel-Go-RED-Staff-Pic.jpg"
  ]
  })

bike2 = Event.new({
  name: "Volunteer Sunday - Bici Centro Raval",
  organizer_id: alex.id,
  start_time: DateTime.strptime("10:00 19/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("14:00 19/03/2017", "%H:%M %d/%m/%Y"),
  address: "Carrer de la Lluna, 08001 Barcelona",
  capacity: 15,
  description: "Volunteer Sunday is the day when we just have volunteers working on bikes, helping us with tasks and hopefully learning something in the process. There’s no experience with bikes required - just a willingness to learn and help out.
  HolaBici is happy to provide Volunteer Opportunities throughout the year - and we love to meet new people that want to help! Bici Centro is always looking for volunteers, whatever your skill level with a bike may be. We're reaching out to Santa Barbara County through our advocacy and education programs, so whether you're showing someone how to fix a bike, ride it safely, or help park it, by volunteering you are making the Raval community stronger.",
  tags: ["Sports", "Community"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/https://d3n8a8pro7vhmx.cloudfront.net/sbbike/pages/32/attachments/original/1447200845/bicithumbsup.jpg"
  ]
  })



hospice = Event.new({
  name: "Bring Joy to Hospice Patients",
  organizer_id: jeanjacques.id,
  start_time: DateTime.strptime("10:00 18/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("14:00 18/03/2017", "%H:%M %d/%m/%Y"),
  address: "St. Croix Hospice, El Carmel, Barcelona",
  capacity: 15,
  description: "St. Croix Hospice is seeking compassionate individuals to visit people affected by a life-limiting illness. We have several volunteer opportunities available: companionship, vigil, and pet therapy.",
  tags: ["Seniors", "Community"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/http://teensgotcents.com/wp-content/uploads/2014/08/nursinghome1-1024x766.jpg"
  ]
  })

fresh = Event.new({
  name: "Help Sort Fresh Produce to go out to hungry",
  organizer_id: jeanjacques.id,
  start_time: DateTime.strptime("18:00 19/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 19/03/2017", "%H:%M %d/%m/%Y"),
  address: "Carrer de Provença 120, 08029 Barcelona",
  capacity: 15,
  description: "Each summer the Food Bank of Barcelona receives thousands of pounds of fresh produce from the farm in Castelldefells, corporate gardens and from distributors. This produce needs to be sorted and bagged for easier access for our partner agencies.
  Responsabilities: Rinse produce (if needed), sort and bag/box produce.",
  tags: ["Homeless", "Community"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/https://www.stanbridge.edu/img/show/reach/REACH_005--lg.jpg"
  ]
  })


fresh3 = Event.new({
  name: "Help Sort Fresh Produce to go out to hungry",
  organizer_id: james.id,
  start_time: DateTime.strptime("18:00 01/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 01/03/2017", "%H:%M %d/%m/%Y"),
  address: "Carrer de Provença 120, 08029 Barcelona",
  capacity: 15,
  description: "Each summer the Food Bank of Barcelona receives thousands of pounds of fresh produce from the farm in Castelldefells, corporate gardens and from distributors. This produce needs to be sorted and bagged for easier access for our partner agencies.
  Responsabilities: Rinse produce (if needed), sort and bag/box produce.",
  tags: ["Homeless", "Community"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/https://www.stanbridge.edu/img/show/reach/REACH_005--lg.jpg"
  ]
  })

hospice3 = Event.new({
  name: "Animal Shelter Volunteers needed!",
  organizer_id: james.id,
  start_time: DateTime.strptime("10:00 19/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("14:00 19/03/2017", "%H:%M %d/%m/%Y"),
  address: "3 carrer de la Unio, Raval, Barcelona",
  capacity: 15,
  description: "Become an animal shelter volunteer and help to improve the quality of life for abandoned animals. We need extra staff to walk dogs on Sunday.",
  tags: ["Animals"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/http://www.catawbahumane.org/wp-content/uploads/2013/03/volunteer.jpg"
  ]
  })


homeless1 = Event.new({
  name: "Sandwiches, Socks or Bottled Water for the Homeless",
  organizer_id: jane.id,
  start_time: DateTime.strptime("20:00 19/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("22:00 19/03/2017", "%H:%M %d/%m/%Y"),
  address: "Parc de la Ciutadella, Barcelona",
  capacity: 15,
  description: "Hello All:
Please join me on this sandwich run.
We will be delivering nutritious bagged lunches to the homeless by walking well travelled routes in downtown Raval where street people live. You will be delivering the lunches with an experienced team leader, who will guide you every step of the way.",
  tags: ["Homeless", "Community"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/https://media.glassdoor.com/l/7b/68/71/41/sandwich-making-for-the-homeless.jpg"
  ]
  })


homeless0 = Event.new({
  name: "Sandwiches, Socks or Bottled Water for the Homeless",
  organizer_id: james.id,
  start_time: DateTime.strptime("20:00 12/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("22:00 12/03/2017", "%H:%M %d/%m/%Y"),
  address: "Parc de la Ciutadella, Barcelona",
  capacity: 15,
  description: "Hello All:
Please join me on this sandwich run.
We will be delivering nutritious bagged lunches to the homeless by walking well travelled routes in downtown Raval where street people live. You will be delivering the lunches with an experienced team leader, who will guide you every step of the way.",
  tags: ["Homeless", "Community"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/https://media.glassdoor.com/l/7b/68/71/41/sandwich-making-for-the-homeless.jpg"
  ]
  })


pet2 = Event.new({
  name: "Bring Joy to Hospice Patients",
  organizer_id: jeanjacques.id,
  start_time: DateTime.strptime("10:00 29/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("14:00 29/03/2017", "%H:%M %d/%m/%Y"),
  address: "St. Croix Hospice, El Carmel, Barcelona",
  capacity: 15,
  description: "St. Croix Hospice is seeking compassionate individuals to visit people affected by a life-limiting illness. We have several volunteer opportunities available: companionship, vigil, and pet therapy.",
  tags: ["Seniors", "Community"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/http://teensgotcents.com/wp-content/uploads/2014/08/nursinghome1-1024x766.jpg"
  ]
  })

old1 = Event.new({
  name: "The Very Best Greatest Most Awesome Event Ever In the Whole Wide Universe",
  organizer_id: jeanjacques.id,
  start_time: DateTime.strptime("10:00 29/03/2015", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("14:00 29/03/2015", "%H:%M %d/%m/%Y"),
  address: "St. Croix Hospice, El Carmel, Barcelona",
  capacity: 15,
  description: "St. Croix Hospice is seeking compassionate individuals to visit people affected by a life-limiting illness. We have several volunteer opportunities available: companionship, vigil, and pet therapy.",
  tags: ["Seniors", "Community"],
  photo_urls: [
    "http://res.cloudinary.com/demo/image/fetch/http://teensgotcents.com/wp-content/uploads/2014/08/nursinghome1-1024x766.jpg"
  ]
  })

fresh3.save
pet2.save
homeless1.save
homeless0.save
fresh.save
homeless0.save
hospice.save
hospice3.save
puppy_feeding.save
teaching_refugees_english.save
teaching_refugees_spanish.save
beach_cleaning.save
nursing_home.save
plant_trees.save
sewing.save
business.save
bike.save
puppy_feeding2.save
bike2.save
women.save
old1.save

registration_one = Registration.new({
  participant_id: joe.id,
  event_id: bike.id
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
registration_nine = Registration.new({
  participant_id: julia.id,
  event_id: plant_trees.id
  })
registration_ten = Registration.new({
  participant_id: johnny.id,
  event_id: homeless1.id
  })

registration_twelve = Registration.new({
  participant_id: johnny.id,
  event_id: bike.id
  })

registration_eleven = Registration.new({
  participant_id: johnny.id,
  event_id: teaching_refugees_english.id
  })

registration_thirt = Registration.new({
  participant_id: julia.id,
  event_id: bike.id
  })

registration_forte = Registration.new({
  participant_id: jimmy.id,
  event_id: bike.id
  })


registration_15 = Registration.new({
  participant_id: jimmy.id,
  event_id: homeless0.id
  })

registration_16 = Registration.new({
  participant_id: johnny.id,
  event_id: homeless0.id
  })

registration_17 = Registration.new({
  participant_id: julia.id,
  event_id: homeless0.id
  })

registration_18 = Registration.new({
  participant_id: joe.id,
  event_id: homeless0.id
  })

registration_19 = Registration.new({
  participant_id: marina.id,
  event_id: homeless0.id
  })

registration_20 = Registration.new({
  participant_id: mariah.id,
  event_id: homeless0.id
  })

registration_22 = Registration.new({
  participant_id: marina.id,
  status: :complete,
  event_id: business.id,
  })

registration_21 = Registration.new({
  participant_id: marina.id,
  status: :complete,
  event_id: puppy_feeding.id,
  })

registration_23 = Registration.new({
  participant_id: marina.id,
  status: :complete,
  event_id: nursing_home.id,
  })

registration_24 = Registration.new({
  participant_id: marina.id,
  status: :complete,
  event_id: fresh3.id,
  })

registration_25 = Registration.new({
  participant_id: mariah.id,
  status: :complete,
  event_id: fresh3.id,
  })

registration_26 = Registration.new({
  participant_id: joe.id,
  status: :complete,
  event_id: fresh3.id,
  })

registration_27 = Registration.new({
  participant_id: johnny.id,
  status: :complete,
  event_id: fresh3.id,
  })

registration_28 = Registration.new({
  participant_id: jackie.id,
  status: :complete,
  event_id: fresh3.id,
  })





registration_28.save
registration_27.save
registration_26.save
registration_25.save
registration_24.save
registration_23.save
registration_22.save
registration_21.save
registration_20.save
registration_19.save
registration_18.save
registration_17.save
registration_16.save
registration_15.save
registration_forte.save
registration_ten.save
registration_nine.save
registration_eleven.save
registration_twelve.save
registration_thirt.save
registration_one.save
registration_two.save
registration_three.save
registration_for.save
registration_five.save
registration_six.save
registration_seven.save
registration_eight.save

reg10 = Registration.new({
  participant_id: jimmy.id,
  event_id: old1.id,
  }).save
reg11 = Registration.new({
  participant_id: joe.id,
  event_id: old1.id,
  }).save
reg12 = Registration.new({
  participant_id: mariah.id,
  event_id: bike.id,
  }).save



puts "///////////////////"
puts bike.attributes
