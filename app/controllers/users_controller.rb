class UsersController < ApplicationController
  before_action :matching_user, :only => [:show]

  def show
    current_user
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    user_role = Role.find_by(title: "user")
    @user.role = user_role
    @user.site_role = user_role
    @user.save
    if @user
      flash["success"] = "Successfully registered user: #{@user.username}. Please log in!"
      redirect_to login_path
    else
      flash["warning"] = user.errors.full_messages
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :email, :password)
  end

end