class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @group = Group.find(params[:group_id])
    @events = @group.events
  end

  def new
    @group = Group.find(params[:group_id])
    @event = Event.new
  end

  def create
    @group = Group.find(params[:group_id])
    @event = Event.new(event_params)
    @event.group = @group
    @event.user = current_user
    if @event.save
      flash[:success] = "Event added!"
      redirect_to group_path(@group)
    else
      flash[:errors] = @event.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @event = Event.find(params[:id])
    @group = @event.group
  end

  def update
    @event = Event.find(params[:id])
    @group = @event.group
    if @event.update(event_params)
      flash[:notice] = 'Event updated'
      redirect_to group_path(@group)
    else
      flash[:notice] = @event.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @group = @event.group
    @event.destroy

    flash[:notice] = "Event deleted"
    redirect_to group_path(@group)
  end

  protected

  def authorize_user
    @event = Event.find(params[:id])
    if !(@event.user == current_user) && current_user.admin == false
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def event_params
    list = [:title, :description, :street, :city, :state, :date, :time]
    params.require(:event).permit(list)
  end
end
