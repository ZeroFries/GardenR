class SessionController < ApplicationController
	def new
	end

	def create
		@user = User.find_by_email params[:email]
		if @user && @user.authenticate(params[:password]) # login
			session[:user_id] = @user.id
			@user.gallery_range = 0
			@user.active_flower = Flower.last.id
			@user.save
			redirect_to root_url
		else #wrong login details
			flash.now[:alert] = "Wrong login details"
			render :new
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end
end
