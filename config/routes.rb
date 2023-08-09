Rails.application.routes.draw do

  # resources :recipes, only: [:index, :show, :create, :update, :destroy] do
  #   resources :favorites, only: [:create]
  #   collection do
  #     get 'search'
  #     get 'search_by_tag'
  #     # GET /recipes/search?search=query to search recipes by title, ingredients, or tags.
  #     # GET /recipes/search_by_tag?tag=query to search recipes by tag.
  #   end
  # end

  resources :favorites, only: [:index, :destroy]
  resources :users, param: :_username do
    resources :recipes, only: [:index, :show, :create, :update, :destroy] do
      resources :favorites, only: [:create]
      collection do
        get 'search'
        get 'search_by_tag'
        # GET /recipes/search?search=query to search recipes by title, ingredients, or tags.
        # GET /recipes/search_by_tag?tag=query to search recipes by tag.
      end
    end
  end

  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'

end
