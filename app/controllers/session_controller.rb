class SessionController < ApplicationController
	def new
	end

	def create
		@user = User.find_by_email params[:email]
		if @user && @user.authenticate(params[:password]) # login
			session[:user_id] = @user.id
			redirect_to root_url
		else #wrong login details
			flash.now[:alert] = "Wrong login details"
		end
	end

	def destroy
		session[:user_id] = nil
	end
end
