class DaysController < ApplicationController
	def index
		@days = current_user.days.all
	end

	def new
		@user = current_user
		@day = current_user.days.new
		3.times { @day.gratitudes.build }
	end
	
	def create
		@day = current_user.days.new(day_params)

		if @day.save
			redirect_to user_days_path(current_user)
		else
			logger.debug "************ #{@day.errors.full_messages} *****************"
			fail
			# flash.now[:error] = "There was a problem saving your gratitudes"
			# render 'new'
		end
	end

	private
	def day_params
		params.require(:day).permit(:id, :user_id, :gratutide_id, gratitudes_attributes: [:id, :body])
	end
end
