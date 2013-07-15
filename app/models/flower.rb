class Flower < ActiveRecord::Base
	belongs_to :flower
	belongs_to :user
	has_many :comments
	has_many :ratings

	validates :url, presence: true
	validates :name, presence: true, length: { minimum: 3 }

	def rating
		i = 0
		self.ratings.each do |rating|
			i += 1 if rating.up_vote
		end
		if self.ratings.size > 0
			i.to_f / self.ratings.size
		else
			nil
		end
	end

	def score
		i = 0
		self.ratings.each do |rating|
			i += 1 if rating.up_vote
			i -= 1 if !rating.up_vote
		end
		i
	end
end
