class BooksController < ApplicationController
  load_and_authorize_resource
  before_filter :check_for_active_book, :except => [:new, :show, :revise, :publish, :destroy, :index, :index_by_status, :add_text, :remove_text]
  before_filter :find_book_by_id, :only => [:show, :edit, :update, :publish, :revise, :destroy, :add_text, :remove_text]
  #before_filter :find_illustrations, :only => [:edit]
  
  # nuevas columnas:

  #   book_status = active, review, published, destroyed
  #   book_message : es un mensaje de nosotros al artista si le pedimos que revise su libro (ver "revise")


  # actions where artists have access to
  # new
  # edit
  # change
  # review


  def index

    status = params[:status]

    if status.nil? || status.empty?

      @books = Book.sorted.all

    else

      @books = Book.sorted.find_all_by_status(status)

    end

  end
 




  def new

    text = Text.find_by_id(params[:text_id])

    if text && text[:availability]

      if @active_book.nil? # user doesn't have an active book

        @book = Book.create(:user_id => current_user.id)

        @book.principal = text
        @book.save

        text.availability = false
        text.save

        @book.texts << text

        if params[:change]
          @change = true
        else
          @change = false
        end

          mail = Notifications.new_book(@book, @change)
          mail.deliver

          mail_admin = Notifications.new_book_admin(@book, @change)
          mail_admin.deliver

        redirect_to edit_book_path @book[:id], :notice => "Book was created succesfully"

      else

        redirect_to edit_book_path @active_book[:id], :notice => "You already have an active book"

      end

    else # if text doesn't exist

      redirect_to texts_path, :notice => "That text doesn't exist or is not available!"

    end


  end

  def edit
    if @book != current_user.active_book || @book.nil?
      @book = current_user.active_book
      redirect_to edit_book_path @book[:id]
    end
  end
  
  def change
    principal_text = @active_book.principal
    principal_text.availability = true
    principal_text.save
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
    unless @book.user_tutorial_mode
      @book.status = "published"
      if @book.save
        mail = Notifications.publish_book(@book)
        mail.deliver
        redirect_to @book, :notice => "book has been published"
      else
        redirect_to @book, :notice => "could not change status"
      end
    else
      redirect_to @book, :notice => "can't publish a book from a user in tutorial mode"
    end
  end

  def revise
    @book.status = "active"
    if @book.save
      redirect_to @book, :notice => "changed status to active"
    else
      redirect_to @book, :notice => "could not change status"
    end
  end

  def destroy
    @book.status = "destroyed"
    if @book.save
      redirect_to @book, :notice => "changed status to destroyed"
    else
      redirect_to @book, :notice =>  "could not change status"
    end
  end

  def add_text

    unless Text.find_by_id(params[:text_id]).nil?
      text = Text.find_by_id(params[:text_id])
      unless text[:deleted]
        unless @book.texts.include?(text)
          unless @book.principal.author.id != text.author.id
            @book.texts << text
            redirect_to edit_book_path @book, :notice => "text added to book"
          else
            redirect_to edit_book_path @book, :alert => "story is not by the same author"
          end
        else
          redirect_to edit_book_path @book, :alert => "book has this story already"
        end
      else
        redirect_to edit_book_path @book, :alert => "can't add a text in the trash can"
      end
    else
      redirect_to edit_book_path @book, :alert => "text doesn't exist"
    end

  end

  def remove_text

    unless Text.find_by_id(params[:text_id]).nil?

      text = Text.find_by_id(params[:text_id])

      if text == @book.principal

        redirect_to edit_book_path @book, :alert => "You can't remove the principal text of the book"

      else
        if @book.texts.delete(text)
          redirect_to edit_book_path @book, :notice => "text removed from book"
        else
          redirect_to edit_book_path @book, :alert => "text not removed from book"
        end
      end
    else
      redirect_to edit_book_path @book, :alert => "text doesn't exist"
    end
  end



  private

  def get_active_book
    @active_book = current_user.books.where(:status => 'active').first
  end

  def check_for_active_book
    redirect_to texts_path if @active_book.nil?
  end

  def find_book_by_id
    @book = Book.find(params[:id])
  end
  
  #def find_illustrations
  #  @inline_illustrations = Hash.new
  #  @book.illustrations.each do |illustration|
  #    @inline_illustrations[illustration.position] = illustration.inline.url
  #  end
  #  @inline_illustrations = ActiveSupport::JSON.encode(@inline_illustrations)
  #end
  
end
