Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'videos#home'

  # User Routes
  get '/signup', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/profile', to: 'users#show', as: 'user'

  get '/login', to: 'sessions#new', as: 'user_login' 
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: "delete_and_destroy_user"

  # Video Routes 
  get '/videos', to: 'videos#index', as: 'videos'
  get '/upload', to: 'videos#new', as: 'new_video'
  post '/videos', to: 'videos#create'
  get '/videos/:id', to: 'videos#show', as: 'video'

  # get '/comments', to: 'comments#index', as: 'comments'
  post '/comments', to: 'comments#create'
end
  