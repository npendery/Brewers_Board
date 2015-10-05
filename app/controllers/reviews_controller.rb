class ReviewsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authorize_user, only: [:edit, :update, :destroy]
  before_action :find_recipe
  respond_to :html, :js

  def index
    @reviews = @recipe.reviews
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.recipe = @recipe
    @review.user = current_user
    if @review.save
      flash[:accepted] = "Review added."
    else
      flash[:errors] = @review.errors.full_messages.join(". ")
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @review.update_attributes(review_params)
        format.html { redirect_to(@review, :notice => 'Review was successfully updated.') }
        format.json { respond_with_bip(@review) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@review) }
      end
    end
  end

  def destroy
    @review.destroy

    flash[:notice] = "Review deleted."
    redirect_to recipe_path(@review.recipe)
  end

  protected

  def authorize_user
    find_recipe
    if !(current_user.admin? || @review.user == current_user)
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end

  def review_params
    params.require(:review).permit(:rating, :title, :description, :recipe_id, :user_id)
  end
end
