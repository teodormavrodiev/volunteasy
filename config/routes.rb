Rails.application.routes.draw do

  # Images implementation
  mount Attachinary::Engine => "/attachinary"

  root to: 'pages#home'

  devise_for :users, path_prefix: 'd'

  resources :users, only: [:show] do
    resources :events, only: [:index]
  end

  resources :events, except: [:index, :show]

  resources :events, only: [:show] do
    resources :registrations, only: [:create, :destroy, :new]
  end

  get '/events/', to: 'events#search', as: 'search'



end
