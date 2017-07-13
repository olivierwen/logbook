class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  private

  def current_user
    @current_user ||= Pilot.find_by(id: session[:pilot_id])
  end

  def logged_in?
    current_user
  end

  # Check if user owner (todo : or admin ?)
  def require_permission
    if current_user != Pilot.find(params[:id]).pilot
      redirect_to root_path
      #Or do something else here
    end
  end
end
