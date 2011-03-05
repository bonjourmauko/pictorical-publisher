class TextsController < ApplicationController
  respond_to :html
  before_filter :authenticate_user!
  before_filter :check_for_active_book
  before_filter :find_text_by_id, :only => [:show, :edit, :update, :destroy]
  
  def index
    @texts = Text.sorted.all
  end

  def show
  end
  
  def new
    @text = Text.new
  end
  
  def create
    @text = Text.new(params[:text])
    @text.save
  end
  
  def edit
  end
  
  def update
    @text.update_attributes(params[:text])
  end
  
  def destroy
    @text.destroy
  end
  
  private
  
  def check_for_active_book
    @active_book = current_user.books.where(:status => 'active').first
  end
  
  def find_text_by_id
    @text = Text.find(params[:id])
  end
  
end
