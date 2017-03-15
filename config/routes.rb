Rails.application.routes.draw do

  ActiveAdmin.routes(self)
  # Images implementation
  mount Attachinary::Engine => "/attachinary"

  # Sidekiq Web UI, only for admins.
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end

  root to: 'pages#home'

  devise_for :users, path_prefix: 'd', :controllers => { :registrations => :devise_registrations, omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :users, only: [:show]

  resources :events, except: [:index, :show]

  resources :events, only: [:show] do
    resources :registrations, only: [:create, :destroy, :update]
  end

  get '/events/', to: 'events#search', as: 'search'
  get '/save_data/', to: 'events#search'
  get '/events/:id/users/', to: 'events#users', as: 'event_users'
  get '/my_events/', to: 'events#my_events', as: 'user_events'
  get "/login_signup/", to: "pages#login_signup", as: "login_signup"
  get '/home_create/', to: 'pages#home_create', as: 'home_create'
  get '/home_search/', to: 'pages#home_search', as: 'home_search'

  get '/new/:number', to: "events#cool_form", as: 'cool_form'
  get '/events/:id/edit/:number', to: "events#cool_form_edit", as: 'cool_form_edit'


end


