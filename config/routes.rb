Rails.application.routes.draw do
  resources :users, param: :_username do
    resources :recipes, only: [:index, :show, :create, :update, :destroy]
  end

  resources :recipes, only: [] do
    resources :favorites, only: [:create, :destroy]
    collection do
      get 'search'
      get 'search_by_tag'
      get 'search_by_title'
    end
  end

  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'
end
