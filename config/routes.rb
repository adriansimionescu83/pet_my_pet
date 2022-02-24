Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :pets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :pets do
    resources :bookings, only: %i[create]
  end

  get 'bookings/:id/approve', to: 'bookings#approve'
  get 'bookings/:id/reject', to: 'bookings#reject'
  resources :bookings, only: %i[index destroy edit update show] do
    resources :reviews, only: %i[create]
  end
end
