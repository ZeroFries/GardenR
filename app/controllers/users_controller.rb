class UsersController < ApplicationController

	def new
		@user = User.new
		name = { var: :username, placeholder: "User name" }
		email = { var: :email, placeholder: "Email" }
		pw = { var: :password, placeholder: "Enter 5+ char password" }
		pw_conf = { var: :password_confirmation, placeholder: "Retype password" }
		@categories = categories_array
	end

	def create
		@user = User.new user_params #wtf how does rails know password and password_confirmation must match, and how
																 # does bcrypt know to encrypt the pw before saving to the db as password_digest?
		@categories = categories_array
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

		def categories_array
			name = { var: :username, placeholder: "User name" }
			email = { var: :email, placeholder: "Email" }
			pw = { var: :password, placeholder: "Enter 5+ char password" }
			pw_conf = { var: :password_confirmation, placeholder: "Retype password" }
			[name, email, pw, pw_conf]
		end
end
