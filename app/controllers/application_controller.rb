class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    User.find session[:user_id] rescue nil
  end
end