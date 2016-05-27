class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
      current_user != nil
    end

    def admin?
    	logged_in? && current_user.utype == 'admin'
    end

    def require_admin
      unless admin?
        flash[:error] = "You must be logged in as an admin to access this page."
        redirect_to '/sessions/new'
      end
    end

end
