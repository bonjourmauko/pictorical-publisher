require 'spec_helper'

describe DashboardController do

  describe "GET 'welcome'" do
    it "should be successful" do
      get 'welcome'
      response.should be_success
    end
  end

end
