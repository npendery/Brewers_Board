class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.order(created_at: :desc)
  end

  def new
    @recipe = Recipe.new
  end

  def create
    authenticate_user!
    # binding.pry
    @recipe = Recipe.new(recipe_params)
    @user = current_user
    @recipe.user = @user

    if @recipe.save
      flash[:accepted] = "Recipe added."
      redirect_to recipe_path(@recipe)
    else
      flash[:errors] = @recipe.errors.full_messages.join(". ")
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    authenticate_user!
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      flash[:accepted] = "Recipe updated."
      redirect_to recipe_path(@recipe)
    else
      flash[:errors] = @recipe.errors.full_messages.join(". ")
      render :edit
    end
  end

  protected

  def recipe_params
    list = [:name,
            :description,
            :malt_grains,
            :hops_schedule,
            :directions,
            :yeast,
            :user
           ]
    params.require(:recipe).permit(list)
  end
end
