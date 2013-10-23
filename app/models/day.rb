class Day < ActiveRecord::Base
	belongs_to :user
	has_many :gratitudes, :dependent => :delete_all
	accepts_nested_attributes_for :gratitudes, reject_if: lambda { |a| a[:body].blank? }
end
