class SessionsController < ApplicationController
	def new
		if current_user.present?
			redirect_to new_user_day_path(current_user)
		end
	end

	def create
		user = User.find_by_login(params[:session][:login].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to new_user_day_path(current_user)
		else
			flash.now[:error] = 'Invalid username/password combination'
			render 'new'
		end
	end

	def destroy
	end
end
