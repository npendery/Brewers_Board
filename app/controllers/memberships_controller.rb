class MembershipsController < ApplicationController
  def create
    @membership = current_user.memberships.build(:group_id => params[:group_id])
    if @membership.save
      flash[:notice] = "You have joined this group."
      redirect_to group_path(params[:group_id])
    else
      flash[:error] = "Unable to join."
      redirect_to group_path(params[:group_id])
    end
  end

  def destroy
    @membership = Membership.find(params[:id])
    @membership.destroy
    flash[:notice] = "Left group."
    redirect_to groups_path
  end

  def membership_params
    params.require(:membership).permit(:user_id, :group_id)
  end
end
