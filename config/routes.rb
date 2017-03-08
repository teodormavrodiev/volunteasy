Rails.application.routes.draw do

  # Images implementation
  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'

  devise_for :users, path_prefix: 'd', :controllers => { :registrations => :devise_registrations }

  resources :users, only: [:show] do
    get '/my_events/', to: 'events#my_events', as: 'events'
  end

  resources :events, except: [:index, :show]

  resources :events, only: [:show] do
    resources :registrations, only: [:create, :destroy]
  end

  get '/events/', to: 'events#search', as: 'search'



end
