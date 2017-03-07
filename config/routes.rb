Rails.application.routes.draw do
  resources :registrations
  resources :events
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Images implementation
  mount Attachinary::Engine => "/attachinary"
end
