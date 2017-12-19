class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private

  def log_in(admin)
    session[:admin_id] = admin.id
  end

  def current_user
    @current_user ||= Admin.find_by(id: session[:admin_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def tourify_owner?
    current_user
    if (@current_user.organization_id === 2)
      return true
    end
  end
end
