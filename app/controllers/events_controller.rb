class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    find_group
    @events = @group.events
  end

  def new
    find_group
    @event = Event.new
  end

  def create
    find_group
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
    find_event
    @group = @event.group
  end

  def update
    find_event
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
    find_event
    @group = @event.group
    @event.destroy

    flash[:notice] = "Event deleted"
    redirect_to group_path(@group)
  end

  protected

  def find_group
    @group = Group.find(params[:group_id])
  end

  def find_event
    @event = Event.find(params[:id])
  end

  def authorize_user
    find_event
    if !(@event.user == current_user) && current_user.admin == false
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def event_params
    list = [:title, :description, :street, :city, :state, :date, :time]
    params.require(:event).permit(list)
  end
end
