class ErrorController < ApplicationController
  skip_before_filter :ensure_current_user

  def error
  end

end