class Api::V1::EventsController < Api::V1::BaseController
  def index
    # Obtain events in order
    @events = policy_scope(Event).order(created_at: :desc)
  end
end
