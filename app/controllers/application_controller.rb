# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  helper_method :current_user, :current_user_session

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end
  
  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end
  
  def authenticate
    unless current_user
    store_location
    flash[:notice] = "Musisz być zalogowany by wykonać tę akcję."
    redirect_to new_user_sessions_path
    end
  end
  
  def store_location
    session[:return_to] = request.url
  end
  
  def redirect_back_or_default(default)
    redirect_to(session[:return_to] || default)
    session[:return_to] = nil
  end
  
  def admin_required
    if !current_user
      redirect_to new_user_session_path
    elsif !current_user.admin?
      flash[:notice] = "Tylko administrator może wykonać tę akcję."
      redirect_to root_url
    end
  end
end
