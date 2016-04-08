Rails.application.routes.draw do

  root 'pages#home'
  post '/sessions' => 'sessions#create_app_login'
  get '/signout' => 'sessions#destroy', :as => :logout

  resource :users

  resources :activities

  resource :sessions


  get '/auth/:provider/callback' => 'sessions#create_fb_login'
  get '/auth/failure' => 'sessions#failure'
  get '/auth/facebook/logout' => 'sessions#facebook_logout', :as => :facebook_logout

  namespace :api do
    resources :activities
  end
end
