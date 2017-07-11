Rails.application.routes.draw do
  get 'sessions/new'

  root to: "pilots#index"
  resources :flights, only: %i[new create]
  resources :pilots
  resource :session, only: %i[new create destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end