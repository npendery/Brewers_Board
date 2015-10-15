class GroupsController < ApplicationController
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @groups = Group.all.order(created_at: :desc)
  end

  def new
    @group = Group.new
  end

  def create
    authenticate_user!
    @group = Group.new(group_params)
    @group.owner = current_user

    if @group.save
      flash[:success] = "Group added!"
      redirect_to group_path(@group)
    else
      flash[:errors] = @group.errors.full_messages.join(". ")
      render :new
    end
  end

  def show
    @group = Group.find(params[:id])
    @current_member = current_member
    @events = @group.events
    # @upcoming_events = @events.upcoming_events
    # @past_events = @events.past_events
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    authenticate_user!
    @group = Group.find(params[:id])

    if @group.update(group_params)
      flash[:success] = "Group updated."
      redirect_to group_path(@group)
    else
      flash[:errors] = @group.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy
    flash[:success] = "Group deleted."
    redirect_to groups_path
  end

  protected

  def authorize_user
    @review = Review.find(params[:id])
    if !(current_user.owner? && @review.user == current_user)
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def current_member
    Membership.where(user_id: current_user, group_id: @group).first
  end

  def group_params
    list = [:name,
            :description,
            :location,
            :owner_id
           ]
    params.require(:group).permit(list)
  end
end
