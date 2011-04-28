class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :get_active_book

  rescue_from CanCan::AccessDenied do |e|
    render "dashboard/cant", :notice => "Sorry you can't access that page.", :layout => "simple"
  end
  
  private
  
  def get_active_book
    unless current_user.nil?
      @active_book = current_user.books.where(:status => 'active').first
    end
  end
  
  
end
