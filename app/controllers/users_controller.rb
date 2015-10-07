class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.admin == true
      @user.admin = false
    else
      @user.admin = true
    end
    if @user.save
      flash[:notice] = "User Updated"
    end
    redirect_to users_path
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    flash[:notice] = "User deleted."
    redirect_to users_path
  end
end
