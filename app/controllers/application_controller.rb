class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |e|
    redirect_to texts_path, :notice => "This is a nice message explaining that you can't access the page you were trying to reach"
  end
end
