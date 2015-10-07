class GroupMessagesController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @group = Group.find(params[:group_id])
    @group_messages = @group.group_messages
  end

  def new
    @group = Group.find(params[:group_id])
    @group_message = GroupMessage.new
  end

  def create
    @group = Group.find(params[:group_id])
    @group_message = GroupMessage.new(group_message_params)
    @group_message.group = @group
    @group_message.user = current_user
    if @group_message.save
      flash[:accepted] = "Message added"
      redirect_to group_path(@group)
    else
      flash[:errors] = "Message " + @group_message.errors.full_messages.join(". ")
      render :new
    end
  end

  def edit
    @group_message = GroupMessage.find(params[:id])
    @group = @group_message.group
  end

  def update
    @group_message = GroupMessage.find(params[:id])
    @group = @group_message.group
    if @group_message.update(group_message_params)
      flash[:notice] = 'Message updated'
      redirect_to group_path(@group)
    else
      flash[:notice] = @group_message.errors.full_messages.join(". ")
      render :edit
    end
  end

  def destroy
    @group_message = GroupMessage.find(params[:id])
    @group = @group_message.group
    @group_message.destroy

    flash[:notice] = "Message deleted"
    redirect_to group_path(@group)
  end

  protected

  def authorize_user
    @group_message = GroupMessage.find(params[:id])
    if !(@group_message.user == current_user) || current_user.admin == false
      raise ActionController::RoutingError.new("Not Found")
    end
  end

  def group_message_params
    list = [:body, :group_id, :user_id]
    params.require(:group_message).permit(list)
  end
end
