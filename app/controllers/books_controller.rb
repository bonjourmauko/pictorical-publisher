class BooksController < ApplicationController
  load_and_authorize_resource
  before_filter :find_book_by_id, :only => [:show, :edit, :update, :publish, :revise, :destroy, :add_text, :remove_text, :expire, :update]


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

        user = @book.user
        user.last_book_no_illustration_reminder_at = 0
        user.save

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
    if @book.status == "active" || current_user.admin? #book is editable
      render :edit
    else #book is not editable
      redirect_to @book, :alert => "The book is not editable. Please wait until we review it, or write help@pictorical.com if there is any problem"
    end
  end

  def show
  end

  def update
    if @book.update_attributes(params[:book])
      redirect_to edit_book_path, :notice => 'Book was successfully updated.'
    else
      redirect_to edit_book_path, :alert => "Book was not updated."
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
      render :review, :layout => "simple"
    end
  end

  def publish
    @book.status = "published"
    if @book.save
      mail = Notifications.publish_book(@book)
      mail.deliver
      redirect_to @book, :notice => "book has been published"
    else
      redirect_to @book, :notice => "could not change status"
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

  def expire
    @book.status = "expired"
    if @book.created_at.advance(:days => 15) < Time.now
      if @book.save


        mail = Notifications.expire_book(@book)
        mail.deliver
        redirect_to book_no_illustration_path, :notice => "changed status to expired"
      else
        redirect_to book_no_illustration_path, :alert => "could not change status"
      end
    else
      redirect_to book_no_illustration_path, :alert => "book is less than 14 days old"
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

  # epub

  def epub
  end

  def epub_content_00copyright
    render "/books/epub/content/00copyright", :layout => false
  end

  def epub_content_01title
    render "/books/epub/content/01title", :layout => false
  end

  def epub_content_02artist
    render "/books/epub/content/02artist", :layout => false
  end

  def epub_content_03story
    render "/books/epub/content/03story", :layout => false
  end

  def epub_content_images_download
    render "/books/epub/content/images/download", :layout => false
  end

  def epub_metadata
    render "/books/epub/metadata", :layout => false
  end

  def epub_toc
    render "/books/epub/toc", :layout => false
  end


  private

  def find_book_by_id
    @book = Book.find(params[:id])
  end


end
