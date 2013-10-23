class DaysController < ApplicationController
	def new
		@day = Day.new
		3.times { @day.gratitudes.build }
	end
	
	def create
		fail
	end
end
