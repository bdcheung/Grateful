class Gratitude < ActiveRecord::Base
	has_one :day
	validates :body, presence: true

	def words
		self.body.downcase.gsub(/[^a-z\s]/, '').split(" ")
	end
end
