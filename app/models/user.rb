class User < ActiveRecord::Base
	validates :username, presence: true,
		length: {minimum: 5, maximum: 25}
	validates :email, presence: true,
		length: {minimum: 5, maximum: 50}
		
	has_many :articles
	has_secure_password
end