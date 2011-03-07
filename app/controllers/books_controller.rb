class BooksController < ApplicationController
  load_and_authorize_resource
  before_filter :get_active_book
  before_filter :check_for_active_book, :except => [:new, :show, :revise, :publish, :destroy]
  
  # nuevas columnas:
  
  #   book_status = active, review, published, destroyed
  #   book_message : es un mensaje de nosotros al artista si le pedimos que revise su libro (ver "revise")
  
  
  # actions where artists have access to
  # new
  # edit
  # change
  # review
  
  
  def new
    
    text_exists = !params[:text_id].nil? && !Text.find(params[:text_id]).nil?
    
    if @active_book.nil? && text_exists
      @book = Book.create(:text_id => params[:text_id], :user_id => current_user.id)
      if params[:change]
        mail = Notifications.change_book(@book)
        mail.deliver
      else
        mail = Notifications.new_book(@book)
        mail.deliver        
      end  
      redirect_to edit_book_path @book[:id]
    else
      redirect_to edit_book_path @active_book[:id]
    end
  end
  
  
  
  
  def edit
    @book = Book.find(params[:id])
    @text = @book.text
    unless @book[:status] == "active"
      @book = Book.where(:user_id => current_user[:id], :status => "active").first
      redirect_to edit_book_path @book[:id]
    end
  end
  
  
  def show
    @book = Book.find(params[:id])
    @text = @book.text
  end
  
  def change    
    @active_book.status = "destroyed"
    @active_book.save

    redirect_to :action => "new", :text_id => params[:text_id], :change => true
  end
  
  def review
    
    @active_book.status = "review"
    if @active_book.save
    
      mail = Notifications.review_book(@active_book)
      mail.deliver
    
    end

  end
  
  def publish
    
    @book = Book.find(params[:id])
    @book.status = "published"
    if @book.save
    
      mail = Notifications.review_book(@active_book)
      mail.deliver
      redirect_to @book    
    end

  end
  
  def destroy
    
    @book = Book.find(params[:id])
    @book.status = "destroyed"
    @book.save

    redirect_to @book
  end
  
  
  def revise
    
    @book = Book.find(params[:id])
    @book.status = "active"
    @book.save
    redirect_to @book
    
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
