Rails.application.routes.draw do
  
  root 'static_pages#home'
  get '/welcome/:id', to: 'welcome_page#welcome'
  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  get '/:id', to: 'static_pages#gossip'
  get '/profile/:id', to: 'static_pages#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
