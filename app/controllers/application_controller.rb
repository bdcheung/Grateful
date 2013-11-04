class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private
  def signed_in
  	redirect_to login_url, notice: "Please sign in" unless signed_in?
  end

  def admin_user
  	redirect_to users_path, notice: "You must be an administrator to do that." unless current_user.admin?
  end
end
