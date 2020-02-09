json.array! @bookings do |booking|
  json.extract! booking, :id, :user, :ticket
end
