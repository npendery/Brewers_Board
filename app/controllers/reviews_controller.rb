class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @reviews = @recipe.reviews
  end

  def new
    find_recipe
    @review = Review.new
  end

  def create
    find_recipe
    @review = Review.new(review_params)
    @review.recipe = @recipe
    @review.user = current_user
    if @review.save
      flash[:success] = "Review added!"
      redirect_to recipe_path(@recipe)
    else
      flash[:errors] = @review.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    find_review
    @recipe = @review.recipe
  end

  def update
    find_review
    @recipe = @review.recipe
    if @review.update(review_params)
      flash[:notice] = 'Review Updated'
      redirect_to recipe_path(@recipe)
    else
      flash[:notice] = @review.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    find_review
    @recipe = @review.recipe
    @review.destroy

    flash[:notice] = "Review deleted."
    redirect_to recipe_path(@recipe)
  end

  protected

  def find_review
    @review = Review.find(params[:id])
  end

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def authorize_user
    find_review
    if !(@review.user == current_user) && current_user.admin == false
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def review_params
    list = [:rating, :title, :description, :recipe_id, :user_id]
    params.require(:review).permit(list)
  end
end
