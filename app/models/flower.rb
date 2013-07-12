class Flower < ActiveRecord::Base
	belongs_to :flower
	belongs_to :user
	has_many :comments
	has_many :ratings

	validates :url, presence: true
	validates :name, presence: true, length: { minimum: 3 }
end
