class AuthController < ApplicationController
  skip_before_filter :ensure_current_user

  def login
    @user = User.find_by(name: params[:name])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_form_path
    end
  end

  def logout
    session.clear
    redirect_to login_form_path
  end
