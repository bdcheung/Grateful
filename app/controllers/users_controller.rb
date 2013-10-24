class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def show
		@user = current_user
	end

	def create
		@user = User.new(user_params)

		if @user.save
			sign_in @user
			flash[:success] = "Welcome to Gratitudes!"
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	private

	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :login, :password, :password_confirmation)
	end
end