class AuthorsController < ApplicationController
  load_and_authorize_resource
  # actions where artists have access to
  # index
  # show



  def index
    @authors = Author.sorted.all
  end

  def show
    @author = Author.find_by_id(params[:id])
  end
  
  def new
    @author = Author.new
  end
  
  def create
    @author = Author.new(params[:author])
    if @author.save
      redirect_to new_text_path, :notice => 'Author was successfully created.'
    else
      render :action => "new"
    end
  end
  
  def edit
    @author = Author.find_by_id(params[:id])
  end
  
  def update
    
    @author = Author.find_by_id(params[:id])
    
    if @author.update_attributes(params[:author])
      redirect_to @author, :notice => 'Author was successfully updated.'
    else
      render :action => "edit"
    end
    
  end
  
  def destroy
    @author.destroy
    redirect_to authors_path
  end



end
