class RatingsController < ApplicationController
	def create
		if current_user
			@flower = Flower.find(params[:flower_id])
			@user = current_user
			@rating = Rating.where(flower: @flower, user: @user).first
			if @rating.nil? #user hasnt rated yet
				@rating = @flower.ratings.build rating_params
				@rating.user = @user
				@rating.save
			else
				Rating.destroy @rating
			end
			redirect_to @flower
		else
			redirect_to root_url
		end
	end

	private

		def rating_params
			params.require(:rating).permit :up_vote
		end
end