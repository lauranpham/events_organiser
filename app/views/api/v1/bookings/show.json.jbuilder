json.extract! @booking, :id, :user, :ticket, :paid
json.extract! @booking.ticket, :id, :event
json.extract! @booking.user, :id, :email
