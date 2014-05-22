class HomeController < ApplicationController
  def index
    if current_user
      home
    else
      render :action => :home,:layout => 'login'
    end
  end
end