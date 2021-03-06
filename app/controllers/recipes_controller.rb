class RecipesController < ApplicationController
  respond_to :html, :js

  def index
    @recipes = Recipe.all.order(created_at: :desc)
    # @styles = @recipies.styles
  end

  def new
    @recipe = Recipe.new
  end

  def create
    authenticate_user!
    @recipe = Recipe.new(recipe_params)
    @user = current_user
    @recipe.user = @user

    if @recipe.save
      flash[:success] = "Recipe added!"
      redirect_to recipe_path(@recipe)
    else
      flash[:errors] = @recipe.errors.full_messages.join(". ")
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
    @reviews = @recipe.reviews
    @ingredients = @recipe.ingredients.split("\r\n")
    @instructions = @recipe.instructions.split("\r\n")
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    authenticate_user!
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      flash[:notice] = "Recipe updated."
      redirect_to recipe_path(@recipe)
    else
      flash[:errors] = @recipe.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    flash[:notice] = "Recipe deleted."
    redirect_to recipes_path
  end

  protected

  def recipe_params
    list = [:name,
            :description,
            :instructions,
            :ingredients,
            :style,
            :yielder,
            :user
           ]
    params.require(:recipe).permit(list)
  end
end
