Rails.application.routes.draw do

  # Images implementation
  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'

  devise_for :users, path_prefix: 'd'

  get '/users/:id', to: 'users#show'
  get '/users/:user_id/events', to: 'users#index'


  resources :events, only: [:show] do
    resources :registrations, only: [:create, :destroy, :new]
  end

  get '/events/', to: 'events#search', as: 'search'

  resources :event, only [:new, :create]

end
