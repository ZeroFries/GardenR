class User < ActiveRecord::Base
	has_many :flowers
	has_many :comments

	has_secure_password # has before save shit to encrypt pw?
	valid_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, format: { with: valid_email }
	validates :password, :username, presence: true, length: { minimum: 5 }
	#validates :username, presence: true, length: { minimum: 5 }
	before_save { |user| user.email.downcase! }
end
