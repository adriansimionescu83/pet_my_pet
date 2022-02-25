Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pets do
    resources :bookings, only: %i[create]
  end

  resources :bookings, only: %i[index destroy edit update show]
  get 'bookings/:id/approve', to: 'bookings#approve'
  get 'bookings/:id/reject', to: 'bookings#reject'
  get 'my_pets', to: 'pets#my_pets'
end
