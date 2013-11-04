class UsersController < ApplicationController
	before_action :signed_in, only: [:index, :show, :edit, :update, :destroy]
	before_action :admin_user, only: [:destroy]

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def show
		@user = current_user
	end

	def edit
		@user = current_user
	end

	def update
		@user = current_user
		if @user.update_attributes(user_params)
			flash[:success] = "Profile updated"
			redirect_to @user
		else
			render 'edit'
		end
	end

	def destroy
		User.find(params[:id]).destroy
		flash[:success] = "User deleted."
		redirect_to root_url
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