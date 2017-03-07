Rails.application.routes.draw do

  # Images implementation
  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'

  devise_for :users, path_prefix: 'd'

  get '/users/:id', to: 'users#show'
  get '/users/:user_id/events', to: 'users#index'

<<<<<<< HEAD
  resources :events do
    resources :registration, only: [:create, :destroy, :new]
  end

  get '/events/', to: 'events#search', as: 'search'

end
