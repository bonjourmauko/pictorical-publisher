class PagesController < ApplicationController
  skip_before_filter :authenticate_user!
  
  def terms_of_service
  end

end
