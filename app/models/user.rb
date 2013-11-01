class User < ActiveRecord::Base
	has_secure_password
	has_many :days
	has_many :gratitudes, through: :days, dependent: :destroy

	before_save { self.login = login.downcase }
	before_create :create_remember_token

	def has_gratitudes_for_day?(day)
		dates = self.gratitudes.pluck(:created_at).map {|x| x.strftime("%Y-%m-%d")}
		dates.include?(day.strftime("%Y-%m-%d"))
	end

	def name
		"#{first_name} #{last_name}"
	end

	def words_used
		gratitudes.each.collect(&:words).flatten
	end

	def words_used_excluding_common
		words_used.delete_if {|x| Gratitude::COMMON_ENGLISH_WORDS.include?(x)}
	end

	def unique_words_used
		words_used.uniq
	end

	def word_cloud_array
		array = []
		self.unique_words_used.each do |word|
			array << "{text: '#{word}', weight: #{self.words_used.count(word)}}"
		end
		array.join(", ")
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
