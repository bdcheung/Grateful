class Gratitude < ActiveRecord::Base
	has_one :day
	validates :body, presence: true
end
