class RecipesController < ApplicationController
  before_action :authorize_request
  before_action :find_recipe, only: [:show, :update, :destroy, :search, :search_by_tag]

  def index
    @user = @current_user
    # @user = User.find_by_username!( params[:])
    # byebug
    if @user.role == "customer"
      @recipes = @user.recipes.all
    else
      @recipes = Recipe.all
    end
    render json: @recipes, status: :ok
  end

  def search
    search_query = params[:search]
    @results = Recipe.where('title LIKE ? OR ingredients LIKE ? OR tags LIKE ?',"%#{search_query}%", "%#{search_query}%", "%#{search_query}%")

    if @results.any?
      render json: @results, status: :ok
    else
      render json: { errors: "No recipes found matching the search criteria" }, status: :not_found
    end
  end

  def search_by_tag
    tag_query = params[:tag]
    @results = Recipe.where('tags LIKE ?', "%#{tag_query}%")

    if @results.any?
      render json: @results, status: :ok
    else
      render json: { errors: "No recipes found with the specified tag" }, status: :not_found
    end
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
    params.require(:recipe).permit(:title, :ingredients, :instructions, :tags, :user_id)
  end

end
