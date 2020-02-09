Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "bookings#index"
  # resources :events, only: [:index, :show] do
  #   resources :tickets, only: [:new, :create]
  # end
  # resources :tickets do
  #   resources :bookings, only: [:new, :create]
  # end
  # resources :bookings, only: [:index, :show, :update, :destroy]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :bookings, only: [:index, :show, :update, :destroy]
      resources :events, only: [:index] do
        resources :bookings, only: [:create]
      end
    end
  end
end
