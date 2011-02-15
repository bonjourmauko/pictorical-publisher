require 'spec_helper'

describe ArtistsController do
  render_views

  def mock_artist(stubs={})
    @mock_artist ||= mock_model(Artist, stubs).as_null_object
  end
  
  describe "GET edit" do
    it "assigns the requested artist as @artist" do
      Artist.stub(:find).with("37") { mock_artist }
      get :edit, :id => "37"
      assigns(:artist).should be(mock_artist)
    end
  end

end
