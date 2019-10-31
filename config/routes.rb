Rails.application.routes.draw do
  
  
 

 resources :sessions, only: [:new, :create, :destroy]
 resources :gossips
 resources :users, only: [:show,:new,:create]
 resources :cities, only:[:show]
 resources :gossips do
 resources :comments, only:[ :new ,:create,:edit ]
end
  root 'gossips#index'
  get '/welcome/:id', to: 'welcome_page#welcome'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  # get '/:id', to: 'static_pages#gossip'
  
  
end
