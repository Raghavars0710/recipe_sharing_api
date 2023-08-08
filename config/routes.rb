Rails.application.routes.draw do

  resources :recipes, only: [:index, :show, :create, :update, :destroy] do
    collection do
      get 'search'
      get 'search_by_tag'
      # GET /recipes/search?search=query to search recipes by title, ingredients, or tags.
      # GET /recipes/search_by_tag?tag=query to search recipes by tag.
    end
  end

  resources :favorites, only: [:create, :destroy]
  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'

end
