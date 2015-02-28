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

  def signup
    @user = User.new(allowed_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
    else
      redirect_to login_form_path
    end
  end

  def allowed_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end