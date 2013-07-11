class Flower < ActiveRecord::Base
	belongs_to :user

	validates :url, presence: true
	validates :name, presence: true, length: { minimum: 3 }
end
