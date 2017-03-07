ruben = User.first

puppy_feeding = Event.new({
  name: "Puppy feeding",
  organizer_id: ruben.id,
  start_time: DateTime.strptime("19:00 25/03/2017", "%H:%M %d/%m/%Y"),
  end_time: DateTime.strptime("21:00 25/03/2017", "%H:%M %d/%m/%Y"),
  address: "The Shelter, 3 calle Princesa 08001 Barcelona",
  capacity: 8,
  description: "Help us feeding puppies at Barcelona shelter!",
  tags: ["animals"]
})

puppy_feeding.save
