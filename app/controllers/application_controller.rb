class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  private 

  # Confirms if user is logged in
  def logged_in_user
    unless user_signed_in?
      redirect_to new_user_session_url, notice: "Please login."
    end
  end

  # Confirms an admin user
  def admin_user
    unless current_user.admin?
      redirect_to root_url, notice: "You're not authorized."
    end
  end
  
end