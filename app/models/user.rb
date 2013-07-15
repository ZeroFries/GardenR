class User < ActiveRecord::Base
	has_many :flowers
	has_many :comments
	has_many :ratings

	has_secure_password # has before save shit to encrypt pw?
	valid_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true, format: { with: valid_email }, uniqueness: { case_sensitive: false }
	validates :password, :username, presence: true, length: { minimum: 5 }, on: :create # so it doesnt try and validate pw on update_attributes
	
	before_create { |user| user.email.downcase! }

end
