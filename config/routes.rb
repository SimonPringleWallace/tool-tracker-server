# frozen_string_literal: true

Rails.application.routes.draw do
  # RESTful routes
  resources :examples, except: %i[new edit]
  resources :users, only: %i[index show update]

  # Custom routes
  post '/sign-up' => 'users#signup'
  post '/sign-in' => 'users#signin'
  delete '/sign-out' => 'users#signout'
  patch '/change-password' => 'users#changepw'

  #tools routes
  get '/tools' => 'tools#index'
  get '/tools/:id' => 'tools#show'
  delete '/tools/:id' => 'tools#destroy'
  patch '/tools/:id' => 'tools#update'
  post '/tools' => 'tools#create'

end
