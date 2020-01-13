Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/airlines', to: 'airlines#index'
  get '/airlines/:id', to: 'airlines#show'

  resources :flights, only: [:show]

  # namespace :passengers, only: [:show, :update]

  get "/passengers/:id", to: "passengers#show"
  # get "/passengers/: id/flights/new", to: "passengers#update"
  patch "/passengers/:id/flights/:flight_id", to: "passengers#update"
end
