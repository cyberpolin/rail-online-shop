class UsersController < ApplicationController
	def new
		render 'register'
	end

	def create
		@user = User.new(user_params)

	  if @user.save
	  	DoMail.welcome_email(@user).deliver!
	    # If account was created successfully, redirect to login page
	    if @user && User.authenticate(@user.username, @user.password)
	    	session[:user_id] = user.id
	    end
	    redirect_to "/"
	    # redirect_to "/sessions/new"
	  else
	    render 'users/new'
	  end
	end

	private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end

end
