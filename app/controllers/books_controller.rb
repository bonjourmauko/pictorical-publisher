class BooksController < ApplicationController
  load_and_authorize_resource
  before_filter :get_active_book
  before_filter :check_for_active_book, :except => [:new]
  
  # nuevas columnas:
  
  #   book_status = active, review, published, destroyed
  #   book_message : es un mensaje de nosotros al artista si le pedimos que revise su libro (ver "revise")
  
  
  # actions where artists have access to
  # new
  # edit
  # change
  # review
  
  
  def new
    if @active_book.nil?
      @book = Book.create(:text_id => params[:text_id], :user_id => current_user.id)
      redirect_to edit_book_path @book[:id]
    else
      redirect_to edit_book_path @active_book[:id]
    end
  end
  
  def edit
    @book = Book.find(params[:id])
    @text = @book.text
  end
  
  def change    
    @active_book.status = "destroyed"
    @active_book.save
    redirect_to :action => "new", :text_id => params[:text_id]
  end
  
  def review
    
    @active_book.status = "review"
    @active_book.save

  end
  
  def publish
    
    @book = Book.find(params[:id])
    @book.status = "review"
    @book.save
    
  end
  
  def revise
    
    @book = Book.find(params[:id])
    @book.status = "active"
    @book.save
    
    
    # Por qué?
    #   Si el artista tiene que reenviar una ilustración (porque se equivocó en el formato, por ejemplo)
    #   hay que volver a poner el texto como activo (para que el artista lo pueda editar)
    # Quien lo llama? Pictorical
    # Qué hace?
    #   book_status = active
    #   book_message = un texto que explique que tiene que cambiar
    #   envía un mail con "you have to change the following stuff:" y book_message
    
  end  
  
  private
  
  def get_active_book
    @active_book = current_user.books.where(:status => 'active').first
  end
  
  def check_for_active_book
    redirect_to texts_path if @active_book.nil?
  end
    
end
