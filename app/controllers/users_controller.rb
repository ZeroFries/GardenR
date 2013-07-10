class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		@user = User.new user_params #wtf how does rails know password and password_confirmation must match, and how
																 # does bcrypt know to encrypt the pw before saving to the db as password_digest?
		if @user.save
			redirect_to root_url, notice: "Logged in"
			session[:user_id] = @user.id
		else
			render :new
		end
	end

	def edit
		@user = current_user
	end

	private

		def user_params
			params.require(:user).permit :email, :username, :password, :password_confirmation
		end
end
