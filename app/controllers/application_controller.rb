class ApplicationController < ActionController::Base
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_filter :authenticate_user!
  
  protected
  
  def after_sign_in_path_for(user)
    pots_path
  end
  
  
  def after_sign_up_path_for(_)
    pots_path
  end
end
