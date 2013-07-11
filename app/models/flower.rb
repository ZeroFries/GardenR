class Flower < ActiveRecord::Base
	belongs_to :flower
	belongs_to :user
	has_many :comments

	validates :url, presence: true
	validates :name, presence: true, length: { minimum: 3 }
end
