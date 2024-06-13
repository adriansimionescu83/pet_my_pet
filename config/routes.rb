Rails.application.routes.draw do
  devise_for :users
  root to: 'pets#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pets do
    resources :bookings, only: %i[create]
  end

  get 'bookings/:id/approve', to: 'bookings#approve'
  get 'bookings/:id/reject', to: 'bookings#reject'

  get 'my_pets', to: 'pets#my_pets'

  get 'bookings/:id/completed', to: 'bookings#completed'
  resources :bookings, only: %i[index destroy edit update show] do
    resources :reviews, only: %i[create]
  end
  # config/routes.rb
  get 'seed_database', to: 'application#seed_database'

end
