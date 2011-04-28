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
        @review_book = current_user.books.find_by_status("review")
        render "start", :layout => "simple"
      end
    end
  end


end
