class FavoritesController < ApplicationController
  before_action :authorize_request
  
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = @recipe.favorites.build(user: current_user)
    
    if @favorite.save
      render json: { message: 'Recipe added to favorites' }, status: :created
    else
      render json: { errors: @favorite.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def destroy
    @favorite = Favorite.find_by(id: params[:id], user: current_user)
    if @favorite
      @favorite.destroy
      render json: { message: 'Recipe removed from favorites' }, status: :ok
    else
      render json: { errors: 'Favorite not found' }, status: :not_found
    end
  end
  
  private
  
  def authorize_request
    unless current_user
      render json: { errors: 'Unauthorized' }, status: :unauthorized
    end
  end
end
