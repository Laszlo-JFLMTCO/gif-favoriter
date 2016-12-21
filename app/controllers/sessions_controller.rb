class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(username: params[:username])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Invalid login"
      redirect_to "/login"
    end
  end

  private

end