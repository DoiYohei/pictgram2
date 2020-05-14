Rails.application.routes.draw do
  root 'pages#index'
  get 'pages/help'
  get 'pages/about'
  
  resources :users
  resources :topics do
    resources :comments, only: [:new, :create]
  end
  
  get 'sessions/new'
  get    '/login',    to: 'sessions#new'
  post   '/login',    to: 'sessions#create'
  delete '/logout',   to: 'sessions#destroy'
  
  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete '/favorites', to: 'favorites#destroy'

end