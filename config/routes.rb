Rails.application.routes.draw do

  get '/welcome/:first_name', to: 'static_pages#welcome'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'

  resources :gossips # routes for gossips
  resources :author, only: [:show]
  resources :city, only: [:show]
  resources :comment

  resources :sessions, only: [:new, :create, :destroy, :index]
  get 'sessions/welcome'
  get 'authorized', to: 'sessions#page_requires_login'

  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
