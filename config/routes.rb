Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # User Routes
  get '/signup', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/profile', to: 'users#show', as: 'user'

  get '/login', to: 'sessions#new', as: 'user_login' 
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: "delete_and_destroy_user"
end
  