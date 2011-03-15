class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  
  rescue_from CanCan::AccessDenied do |e|
    redirect_to texts_path, :notice => "Nice message explaining that you do not want to see what's in there"
  end
end
