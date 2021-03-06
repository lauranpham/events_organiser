# README
***EVENTS ORGANISER API PROGRAM***
Hi and welcome to your ultimate events organiser program.
This program allows you to obtain information about events, book events,
update your booking and cancel your booking.
``` bash
bundle install
rails db:create db:migrate db:seed
rails s
```
**INDEX Events**
http://localhost:3000/api/v1/events

**INDEX Bookings**
http://localhost:3000/api/v1/bookings

**SHOW Booking**
http://localhost:3000/api/v1/bookings/1

2. Obtain the user's unique token in the database (randomly generated) and insert into the following API calls.
```bash
rails c
User.find_by(email:"lauranpham@gmail.com")
```
3. Use a browser "Rest Client" (Like Postman) to run API calls by inserting the curl commands provided below.
4. Add Authorization (basic auth)
username: lauranpham@gmail.com
pw: 123123

**CREATE Booking**
curl -i -X POST                                                              \
     -H 'Content-Type: application/json'                                     \
     -H 'X-User-Email: lauranpham@gmail.com'                                      \
     -H 'X-User-Token: ADD-TOKEN-HERE'                                \
     http://localhost:3000/api/v1/events/2/bookings

**UPDATE Booking**
curl -i -X PATCH                                        \
     -H 'Content-Type: application/json'              \
     -H 'X-User-Email: lauranpham@gmail.com'               \
     -H 'X-User-Token: ADD-TOKEN-HERE'          \
     -d '{ "booking": { "paid": "true" } }'    \
    http://localhost:3000/api/v1/bookings/2


**DELETE Booking**
curl -i -X DELETE                               \
     -H 'X-User-Email: lauranpham@gmail.com'         \
     -H 'X-User-Token: ADD-TOKEN-HERE'    \
     http://localhost:3000/api/v1/bookings/2

**PROTOTYPE VS. PRODUCTION SYSTEM**
This prototype allows users to see events, book a ticket, update a ticket to
paid and delete a ticket booking.

In a production system (and given more time) the following changes could be made:
- User authorized creation, updating and deletion of events
- Multiple tickets per booking
- Integrated payment systems e.g. stripe that updates paid attribute of booking
- Notification systems to event admins for booking changes
- Different levels of testing (unit, integration, system and acceptance)
- Validations on email and date formats
- Location attributes and maps on events

**TESTING**
There is a quick models test integrated into the program.
```bash
bundle exec rspec
```

