require 'spec_helper'

describe PagesController do

  describe "GET 'terms_of_service'" do
    it "should be successful" do
      get 'terms_of_service'
      response.should be_success
    end
  end

end
