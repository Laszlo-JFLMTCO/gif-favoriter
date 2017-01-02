class Admin::UsersController < ApplicationController
  before_action :confirm_admin

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @roles = Role.all
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    new_role = Role.find(params[:user][:role])
    @user.role = new_role
    @user.site_role = new_role
    if @user.save
      flash["success"] = "#{@user.username} user details were successfully updated"
      redirect_to admin_user_path(@user)
    else
      flash["danger"] = @user.errors.full_messages
      @roles = Role.all
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end

  def confirm_admin
    if current_user
      if current_user.admin?
      else
        flash["danger"] = "You were not authorized to view that page, here is your page instead."
        redirect_to user_path(current_user)
      end
    else
      flash["danger"] = "You need to be signed in to view that page..."
      redirect_to login_path
    end
  end
end