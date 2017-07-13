Rails.application.routes.draw do
  get 'sessions/new'

  root to: "pilots#index"
  resources :flights
  resources :pilots
  resource :session, only: %i[new create destroy]

  # authenticated :pilots do
  #   resources :pilots
  #   resources :flights
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end