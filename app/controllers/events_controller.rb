class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @tickets = @event.tickets
    @booking = Booking.new
  end
end
