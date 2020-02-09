puts 'Cleaning database...'

Booking.destroy_all
Ticket.destroy_all
Event.destroy_all
User.destroy_all

puts "Creating users"
user1 = User.create(email: "l.pham2311@gmail.com", password: "123123")
user2 = User.create(email: "lauranpham@gmail.com", password: "123123")

puts "Creating events"
event1 = Event.create(name: "Jorja Smith Gig", date: DateTime.new(2020,2,14), description: "An intimate gig with the lovely Jorja Smith. Singing `Don't watch me cry`, `Carry me Home` and much more", user: user1)
event2 = Event.create(name: "C# Coding Day", date: DateTime.new(2020,2,27), description: "Learn more about the C# programming language with the awesome team at Youtility", user: user1)

puts "Creating tickets"
ticket1 = Ticket.create(event: event1)
10.times do
  Ticket.create(event: event1)
end

ticket2 = Ticket.create(event: event2)
15.times do
  Ticket.create(event: event2)
end

puts "Creating bookings"
booking1 = Booking.create(user: user2, ticket: ticket1)
booking1.ticket.update(reserved: true)
booking2 = Booking.create(user: user2, ticket: ticket2)
booking2.ticket.update(reserved: true)
