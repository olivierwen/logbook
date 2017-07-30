Rails.application.routes.draw do
  get 'sessions/new'

  get '/stats', to: 'flights#stats'

  root to: "flights#stats"
  resources :flights
  resources :pilots
  resource :session, only: %i[new create destroy]

  # authenticated :pilots do
  #   resources :pilots
  #   resources :flights
  # end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end