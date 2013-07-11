class UsersController < ApplicationController

	def new
		@user = User.new
		@categories = categories_array
	end

	def create
		@user = User.new user_params #wtf how does rails know password and password_confirmation must match, and how
																 # does bcrypt know to encrypt the pw before saving to the db as password_digest?
		@categories = categories_array
		if @user.save
			redirect_to @user, notice: "Thanks for signing up! Feel free to start adding your creations, or check out the gallery"
			session[:user_id] = @user.id
			current_user = @user
		else
			render :new
		end
	end

	def edit
		@user = current_user
	end

	def show
		@user = current_user
		@flowers = @user.flowers.reverse
	end

	private

		def user_params
			params.require(:user).permit :email, :username, :password, :password_confirmation
		end

		def categories_array
			name = { var: :username, placeholder: "User name" }
			email = { var: :email, placeholder: "Email" }
			pw = { var: :password, placeholder: "Password" }
			pw_conf = { var: :password_confirmation, placeholder: "Retype password" }
			[name, email, pw, pw_conf]
		end
end
