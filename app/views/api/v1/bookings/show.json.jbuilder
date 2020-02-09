json.extract! @booking, :id, :user, :ticket, :paid
json.extract! @booking.ticket, :id, :event
