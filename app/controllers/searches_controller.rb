class SearchesController < ApplicationController
  def index
    @search_results_recipe = Recipe.search(params[:search])
    @search_results_review = Review.search(params[:search])
    @search_results_group = Group.search(params[:search])
    @search_results_user = User.search(params[:search])
    @search_results_event = Event.search(params[:search])
  end
end
