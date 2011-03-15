class TextsController < ApplicationController
  load_and_authorize_resource
  #respond_to :html
  before_filter :get_active_book, :only => [:show, :index]
  before_filter :find_text_by_id, :only => [:show, :trash_show, :edit, :update, :make_available, :make_unavailable]
  before_filter :find_authors, :only => [:index, :trashed_index]
  
  # actions where artists have access to
  # index
  # show
  
  def index
  end
  
  def trashed_index
  end
  
  def show  
  end
  
  def trashed_show
  end
  
  def new
    @text = Text.new
  end
  
  def create
    @text = Text.new(params[:text])
    
      @text.availability = true
      
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
  
  def trashed_destroy
    @text.deleted = true
    @text.availability = false
    if @text.save
      redirect_to texts_path, :notice => 'Text was successfully deleted.'
    else
      redirect_to @text, :notice => 'Text was not deleted.'
    end
  end
  
  def trashed_undestroy
    @text.deleted = false
    @text.availability = true
    if @text.save
      redirect_to texts_path, :notice => 'Text was successfully undeleted.'
    else
      redirect_to @text, :notice => 'Text was not undeleted.'
    end
  end
  
  def destroy
 
    #if there are existing books with this text
        
    if @text.books.not_deleted.empty? && @text.destroy
      redirect_to trashes_path, :notice => 'Text was successfully destroyed for ever.'
    else
      redirect_to @text, :notice => 'Text was not destroyed.'
    end
  end
  
  
  def make_available
    @text.availability = true
    if @text.save
      redirect_to @text, :notice => 'Text now is available.'
    else
      redirect_to @text, :notice => 'Text was NOT made available.'
    end
  end
  
  def make_unavailable
    @text.availability = false
    if @text.save
      redirect_to @text, :notice => 'Text now is unavailable.'
    else
      redirect_to @text, :notice => 'Text was NOT made unavailable.'
    end
  end
  
  private
  
  def get_active_book
    @active_book = current_user.books.where(:status => 'active').first
  end
  
  def find_text_by_id
    @text = Text.find(params[:id])
  end
  
  def find_authors
    @authors = Author.sorted.all
  end
  
end
