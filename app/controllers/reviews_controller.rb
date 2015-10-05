class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @reviews = @recipe.reviews
  end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    @review = Review.new(review_params)
    @review.recipe = @recipe
    @review.user = current_user
    if @review.save
      flash[:accepted] = "Review added."
      redirect_to recipe_path(@recipe)
    else
      flash[:errors] = @review.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = 'Review Updated'
      redirect_to recipe_path(@recipe)
    else
      flash[:notice] = @review.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    @review.destroy

    flash[:notice] = "Review deleted."
    redirect_to recipe_path(@review.recipe)
  end

  protected

  # # def authorize_user
  # #   @review = Review.find(params[:id])
  # #   if !(@review.user == current_user)
  # #     raise ActionController::RoutingError.new("Not Found")
  # #   end
  # # end
  #
  # def find_recipe
  #   @recipe = Recipe.find(params[:recipe_id])
  # end

  def review_params
    params.require(:review).permit(:rating, :title, :description, :recipe_id, :user_id)
  end
end