class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  before_filter :get_active_book

  rescue_from CanCan::AccessDenied do |e|
    redirect_to texts_path, :notice => "This is a nice message explaining that you can't access the page you were trying to reach"
  end
  
  private
  
  def get_active_book
    unless current_user.nil?
      @active_book = current_user.books.where(:status => 'active').first
    end
  end
  
  
end
