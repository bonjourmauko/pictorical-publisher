class BooksController < ApplicationController
  before_filter :authenticate_user!
  
  def edit
    @book = Book.find(params[:id])
  end

end
