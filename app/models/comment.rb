class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :flower

	validates :note, presence: true
end
