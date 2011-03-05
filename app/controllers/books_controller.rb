class BooksController < ApplicationController
  before_filter :authenticate_user!
  
  # nuevas columnas:
  
  #   book_status = active, review, published, destroyed
  #   book_message : es un mensaje de nosotros al artista si le pedimos que revise su libro (ver "revise")
  
  def new
    @book = Book.create(:text_id => params[:text_id], :user_id => current_user.id)
    redirect_to edit_book_path @book[:id]
    #redirect_to :action => "edit", :id => active_book.id
  end  
  
  def create
        
    # Por qué?
    #   El artista crea un libro a partir de un texto
    # Quién lo llama? El artista
    # Qué hace?
    # si el user no tiene un book con book_status = active
    # entonces:
    #   crea un book con
    #   user_id = user.id
    #   text_id = el texto que eligió el user (puede ser pasado como parametro books/create?text=123)
    #   book_status = active
    #   además setea el book.text.status = locked
    #   y muestra el book_edit book#edit
    #   esta acción no tiene vista
    # si el user ya tiene un book con book_status = active se lo manda a su book activo y se le muestra un flash message
    
  end
  
  def change
    
    active_book = current_user.books.where(:status => 'active').first
    
    active_book.status = "destroyed"
    active_book.save
    
    redirect_to :action => "new", :text_id => params[:text_id]
    
    
    # Por qué?
    #   El artista quiere cambiar de libro
    # Quién lo llama? El artista
    # Qué hace?
    #   book_status = destroyed
    #   y setea el book.text.status = available
    #   y muestra la vista book#change 
    
    # no destruir el book por si se arrepienten después

  end
  
  def edit
    @book = Book.find(params[:id])
    @text = @book.text
  end
  
  def review
    
    # Por qué?
    #   el artista termina de subit las ilustraciones y apreta un botón "publish" al final de book#edit
    # Qué hace?
    #   book_status = review
    #   muestra la vista books#review y manda un mail "your book is under review"
    
  end
  
  def publish
    
    # Por qué?
    #   El libro ya fue publicado
    # Quién lo llama? Pictorical
    # Qué hace?
    #   book_status = published
    #   envía un email "hell yeah! your book is published"
    
  end
  
  def revise
    
    # Por qué?
    #   Si el artista tiene que reenviar una ilustración (porque se equivocó en el formato, por ejemplo)
    #   hay que volver a poner el texto como activo (para que el artista lo pueda editar)
    # Quien lo llama? Pictorical
    # Qué hace?
    #   book_status = active
    #   book_message = un texto que explique que tiene que cambiar
    #   envía un mail con "you have to change the following stuff:" y book_message
    
  end
  
  
  
  
end
