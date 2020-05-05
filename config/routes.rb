Rails.application.routes.draw do

  get '/welcome/:first_name', to: 'dynamic_pages#welcome'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/', to: 'homa_page#home'
  get '/gossip/:num', to: 'dynamic_pages#gossippage'
  get '/author/:number', to: 'dynamic_pages#author'

  resources :gossips, only: [:new, :create] # routes for gossips

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
