class HomeController < ApplicationController
  def index
    if current_user
      render :action => :index
    else
      render :action => :login
    end
  end

  def login
    unless params[:name].blank? || params[:password].blank?
      if (user = User.find_by_name_and_password(params[:name], Digest::MD5::hexdigest(params[:password])))
        set_session_user user
        render :action => :index
      else
        flash[:un] = params[:name]
        flash[:u_error] = true
      end
    end
  end


end