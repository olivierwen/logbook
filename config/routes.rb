Rails.application.routes.draw do
  root to: "pilots#index"
  resources :flights
  resources :pilots
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
