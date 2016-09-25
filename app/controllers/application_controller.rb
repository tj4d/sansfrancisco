class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  private

  helper_method :current_user
  helper_method :require_signin!

  def current_user
	 @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_signin!
	if current_user.nil?
	  redirect_to signin_path
	end
  end
end
