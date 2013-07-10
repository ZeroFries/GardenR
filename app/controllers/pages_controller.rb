class PagesController < ApplicationController
	def home
		if current_user
		else
			render action: "landing_page"
		end
	end

	def landing_page
	end

	def about
	end

	def contact
	end
end
