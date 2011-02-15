class BooksController < ApplicationController
  
  def edit
    @book = Book.find(params[:id])
  end

end
