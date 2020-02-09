class Api::V1::BookingsController < Api::V1::BaseController
  acts_as_token_authentication_handler_for User, except: [ :index, :show ]
  before_action :set_booking, only: [ :show, :update, :destroy ]
  def index
    @bookings = policy_scope(Booking)
  end

  def show
  end

  def create
    @event = Event.find(params[:event_id])
    @ticket = @event.tickets.where(reserved: false).first
    @booking = Booking.new(ticket: @ticket)
    @booking.user = current_user
    authorize @booking
    if @booking.save
      @booking.ticket.update(reserved: true)
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    authorize @booking
    if @booking.update(booking_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @booking.ticket.update(reserved: false)
    @booking.destroy
    head :no_content
    # No need to create a `destroy.json.jbuilder` view
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking # For Pundit
  end

  def booking_params
    params.require(:booking).permit(:paid)
  end

  def render_error
    render json: { errors: @booking.errors.full_messages },
      status: :unprocessable_entity
  end
end
