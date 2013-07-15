class FlowersController < ApplicationController
	def new
		if current_user
			@flower = Flower.new
			@categories = flower_categories
		else
			redirect_to root_url, notice: "Login to start adding to the gallery"
		end
	end

	def create
		@flower = Flower.new flower_params
		@flower.user_id = current_user.id
		if @flower.save
			#redirect_to @flower
			redirect_to root_url
		else
			render :new
		end
	end

	def index
		if current_user
			@flowers = Flower.all.reverse
			@range = current_user.gallery_range
			@active = current_user.active_flower
		else
			redirect_to root_url
		end
	end

	def next
		@test = "hi"
		current_user.update_attributes(active_flower: current_user.active_flower - 1)
		current_user.update_attributes(gallery_range: current_user.gallery_range + 1) if current_user.active_flower % 12 == 0
		redirect_to flowers_url
	end

	def prev
		current_user.update_attributes(active_flower: current_user.active_flower + 1)
		current_user.update_attributes(gallery_range: current_user.gallery_range - 1) if current_user.active_flower % 12 == 0
		redirect_to flowers_url
	end

	def show
		@flower = Flower.find(params[:id])
		@user = User.find(@flower.user_id)
		@comment = Comment.new if current_user
		@rating = Rating.new if current_user
		@categories = [{var: :note, placeholder: "Add a comment"}]
	end

	def edit
	end

	def destroy
	end

	private

		def flower_params
			params.require(:flower).permit :url, :name, :description
		end

		def flower_categories
			url = { var: :url, placeholder: "Image URL" }
			name = { var: :name, placeholder: "Name" }
			description = { var: :description, placeholder: "Description" }
			[url, name, description]
		end
end
