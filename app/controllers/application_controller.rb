class ApplicationController < ActionController::Base
  protect_from_forgery

  helper :all
  helper_method :current_user

  before_filter :count_requests_in_session

  def count_requests_in_session
    session[:requests] ||= 0
    session[:requests] += 1
  end

  def check_session
    if session[:user_id].nil?
      redirect_to :controller => :sessions, :action => :new
    end
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

end
