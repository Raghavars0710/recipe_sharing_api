class RecipesController < ApplicationController
  before_action :authorize_request
  before_action :find_recipe, only: [:show, :update, :destroy]
  
  def index
    @recipes = Recipe.all
    render json: @recipes, status: :ok
  end

  def show
    render json: @recipe, status: :ok
  end

  def create
    @recipe = Recipe.new(recipe_params)
    
    if @recipe.save
      render json: @recipe, status: :created
    else
      render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @recipe.update(recipe_params)
      render json: @recipe, status: :ok
    else
      render json: { errors: @recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    if @recipe.destroy
      head :no_content
    else
      render json: { errors: 'Recipe not deleted' }, status: :unprocessable_entity
    end
  end

  private

  def find_recipe
    @recipe = Recipe.find_by_id(params[:id])
    unless @recipe
      render json: { errors: 'Recipe not found' }, status: :not_found
    end
  end

  def recipe_params
    params.require(:recipe).permit(:title, :ingredients, :instructions, :tags)
  end
end
