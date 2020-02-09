json.array! @events do |event|
  json.extract! event, :id, :user, :name, :description, :date
  json.tickets event.tickets do |ticket|
    json.extract! ticket, :id, :reserved
  end
end
