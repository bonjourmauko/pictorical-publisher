class TextsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :check_for_active_book
  
  def index
    @texts = Text.sorted.all
  end

  def show
    @text = Text.find(params[:id])
  end
  
  private
  
  def check_for_active_book
    @active_book = current_user.books.where(:status => 'active').first
  end
  
end
