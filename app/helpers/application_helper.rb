module ApplicationHelper

  def current_user
    if session[:user_id]
      true
    else
      false
    end
  end

end
