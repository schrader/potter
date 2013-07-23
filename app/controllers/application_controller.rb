class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :enable_mini_profiler
  before_filter :store_path
  before_filter :authenticate_user!
  after_filter :unset_return_to_path

  protected

  def redirect_to_main_url
    
  end
  
  def after_sign_in_path_for(user)
    session[:return_to_path] || pots_path
  end
  
  def after_sign_up_path_for(_)
    pots_path
  end

  def store_path
    session[:return_to_path] = request.url unless signed_in? || request.fullpath =~ /\/users/
  end

  def unset_return_to_path
    session[:return_to_path] = nil if signed_in?
  end

  def enable_mini_profiler
    if params[:enable_mini_profiler] || session[:enable_mini_profiler] 
      Rack::MiniProfiler.authorize_request
      session[:enable_mini_profiler] = true
    end
  end
end
