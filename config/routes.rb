Rails.application.routes.draw do

  resources :recipes, only: [:index, :show, :create, :update, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'

end
