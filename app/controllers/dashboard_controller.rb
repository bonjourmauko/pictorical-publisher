class DashboardController < ApplicationController

  def welcome

  end

  def start
    if (Time.now - current_user.created_at) < 10.seconds
      render "welcome", :layout => "simple"
    else
      if current_user.admin?
        render "admin"
      else
        render "start", :layout => "simple"
      end
    end
  end


end
