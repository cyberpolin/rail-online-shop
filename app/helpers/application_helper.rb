module ApplicationHelper
	def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def admin?
  	logged_in? && current_user.utype == 'admin'
  end

end
