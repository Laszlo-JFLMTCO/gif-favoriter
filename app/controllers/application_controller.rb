class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :matching_user

  before_action :require_login

  private

  def require_login
    current_user
  end

  def current_user
    @current_user ||=User.find(session[:user_id]) if session[:user_id]
  end

  def matching_user
    if !session[:user_id].to_i.eql?(params[:id].to_i)
      flash["danger"] = "Not authorized to view the requested page. Here is your page instead!"
      redirect_to user_path(session[:user_id])
    end
  end


end
