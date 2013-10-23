class Day < ActiveRecord::Base
	belongs_to :user
	has_many :gratitudes, dependent: :destroy
	accepts_nested_attributes_for :gratitudes
end
