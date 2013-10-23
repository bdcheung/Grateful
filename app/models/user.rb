class User < ActiveRecord::Base
	has_secure_password
	has_many :days
	has_many :gratitudes, through: :days, dependent: :destroy

	before_save { self.login = login.downcase }
	before_create :create_remember_token

	def name
		"#{first_name} #{last_name}"
	end

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private
	def create_remember_token
		self.remember_token = User.encrypt(User.new_remember_token)
	end
end
