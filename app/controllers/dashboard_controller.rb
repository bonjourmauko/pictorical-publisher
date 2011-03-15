class DashboardController < ApplicationController
  before_filter :get_active_book #@active_book



  def welcome

    unless (Time.now - current_user.created_at) < 10.seconds #newly created user
      if @active_book.nil?
        redirect_to texts_path
      else
        redirect_to edit_book_path @active_book[:id]
      end
    end

  end


  private

  def get_active_book
    @active_book = current_user.books.where(:status => 'active').first
  end

end
