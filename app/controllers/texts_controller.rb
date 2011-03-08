class TextsController < ApplicationController
  load_and_authorize_resource
  respond_to :html
  before_filter :get_active_book, :only => [:show, :index]
  before_filter :find_text_by_id, :only => [:show, :edit, :update, :destroy]
  
  # actions where artists have access to
  # index
  # show
  
  def index
    @authors = Author.sorted.all
  end

  def show  
  end
  
  def new
    @text = Text.new
  end
  
  def create
    @text = Text.new(params[:text])
    
      if @text.save
        redirect_to @text, :notice => 'Text was successfully created.'
      else
        render :action => "new"
      end
    
  end
  
  def edit
  end
  
  def update
        
    if @text.update_attributes(params[:text])
      redirect_to @text, :notice => 'Text was successfully updated.'
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @text.deleted = true
    if @text.save
      redirect_to @text, :notice => 'Text was successfully deleted.'
    else
      redirect_to @text, :notice => 'Text was not deleted.'
    end
  end
  
  private
  
  def get_active_book
    @active_book = current_user.books.where(:status => 'active').first
  end
  
  def find_text_by_id
    @text = Text.find(params[:id])
  end
  
end
