Rails.application.routes.draw do
  get 'events/index'
  get 'events/show'
  get 'bookings/index'
  get 'bookings/show'
  get 'bookings/new'
  get 'bookings/create'
  get 'bookings/update'
  get 'bookings/destroy'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "bookings#index"
end
