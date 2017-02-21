class ApplicationController < ActionController::Base
  # include CanCan::ControllerAdditions
  protect_from_forgery with: :exception

  NBR_LINE = 10

  def authenticate_user
    redirect_to new_session_path, notice: "Please sign in" unless user_signed_in?
  end

  def user_signed_in?
    session[:user_icd].present?
  end
  helper_method :user_signed_in?


  def current_user
    @current_user ||= User.find_by_id session[:user_id] if user_signed_in?
  end
  helper_method :current_user

end
