class CommentsController < ApplicationController
	def create
		if current_user
			@flower = Flower.find(params[:flower_id])
			@comment = @flower.comments.build comment_params
			@comment.user_id = current_user.id
			if @comment.save
				redirect_to @flower, notice: "Comment added"
			else
				redirect_to @flower
			end
		else
			redirect_to root_url
		end
	end

	def edit
	end

	def destroy
	end

	private

		def comment_params
			params.require(:comment).permit :note
		end
end
