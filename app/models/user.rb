class User < ActiveRecord::Base
	has_secure_password
	has_many :days
	has_many :gratitudes, through: :days, dependent: :destroy
end
