require 'spec_helper'

describe BooksController do
  render_views

  def mock_book(stubs={})
    @mock_book ||= mock_model(Book, stubs).as_null_object
  end
  
  describe "GET edit" do
    it "assigns the requested book as @book" do
      Book.stub(:find).with("37") { mock_book }
      get :edit, :id => "37"
      assigns(:book).should be(mock_book)
    end
  end

end
