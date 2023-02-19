class ApplicationController < ActionController::Base
  private 

  # Confirms an admin user
  def admin_user
    unless current_user.admin?
      redirect_to root_url
      flash[:danger] = "you're not authorized."
    end
  end
end