class SessionsController < ApplicationController

	def create
	  user = User.find_by(username: params[:user][:username])
	  password = params[:user][:password]

	  if user && User.authenticate(params[:user][:username], password)
	    session[:user_id] = user.id
	    redirect_to "/"
	  else
	    redirect_to '/sessions/new'
	  end
	end

	def delete
		session.clear
		redirect_to '/'
	end

end
