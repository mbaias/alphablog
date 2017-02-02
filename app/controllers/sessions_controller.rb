class SessionsController < ApplicationController
	def new
		if logged_in?
			redirect_to root_path
		end
	end
  def create
	  user = User.find_by(email: params[:email])
	  if user && user.authenticate(params[:password])
	    session[:user_username] = user.username
	    session[:user_id] = user.id
	    redirect_to root_url, notice: "Welcome #{session[:user_username]}!"
	  else
	    flash.now.alert = 'Email or password is invalid'
	    render :new
	  end
	end
	def destroy
	  session[:user_id] = nil
	  redirect_to root_url, notice: 'Logged out!'
	end
end
