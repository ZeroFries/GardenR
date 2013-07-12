class RatingsController < ApplicationController
	def create
		if current_user
			@flower = Flower.find(params[:flower_id])
			@user = current_user
			@rating = Rating.where(flower: @flower, user: @user).first_or_create(up_vote: uprating_params)
			@rating.user = @user
			redirect_to @flower, notice: "Your vote has added"
		else
			redirect_to root_url
		end
	end

	private

		def rating_params
			params.require(:rating).permit :up_vote
		end
end