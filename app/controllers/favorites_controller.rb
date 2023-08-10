class FavoritesController < ApplicationController
  before_action :authorize_request
  before_action :set_favorite, only: [:destroy]

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = @recipe.favorites.build(user_id: @current_user.id)
    
    if @favorite.save
      render json: { message: 'Recipe added to favorites' }, status: :created
    else
      render json: { errors: @favorite.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def destroy
    if @favorite.user_id == @current_user.id 
      @favorite.destroy
      head :no_content
    else
      render json: { error: 'Unauthorized to delete this favorite.' }, status: :unauthorized
    end
  end
  
  private

  def set_favorite
    @recipe = Recipe.find(params[:recipe_id])
    @favorite = @recipe.favorites.find_by(params[:id],user_id:@current_user.id )
  end

  def authorize_request
    unless @current_user
      render json: { errors: 'Unauthorized' }, status: :unauthorized
    end
  end
end
