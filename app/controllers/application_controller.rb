class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :ensure_current_user
  helper_method :current_user

  def ensure_current_user
    redirect_to login_path unless current_user
  end

  def current_user
    return User.find_by(id: session[:user_id])
  end
end