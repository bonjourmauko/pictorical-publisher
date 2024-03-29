class Notifications < ActionMailer::Base

  default :reply_to => 'hello@pictorical.com',
          :return_path => 'Pictorical Team <hey@pictorical.com>',
          :from => 'Pictorical Team <hey@pictorical.com>',
          :bcc => 'log@pictorical.com'

  def new_book(book, change)
    @book = book
    @change = change
    @expiration = (Time.now.advance :weeks => 2).strftime("%e %B")
    if change
      @subject = "You are now illustrating #{@book.title}"
    else
      @subject = "You are illustrating #{@book.title}"
    end
    mail(:to => @book.user_email, :subject => @subject) do |format|
      format.html
    end
  end

  def review_book(book)
    @book = book
    @subject = "We received #{@book.title}"
    mail(:to => @book.user_email, :subject => @subject) do |format|
      format.html
    end
  end

  def publish_book(book)
    @book = book
    @subject = "Your book #{@book.title} has been published"
    mail(:to => @book.user_email, :subject => @subject) do |format|
      format.html
    end
  end

  def create_invitation(invitation, host)
    @invitation = invitation
    @url = "http://" + host + new_user_registration_path
    @subject = "Good news from Pictorical"
    mail(:to => @invitation[:email], :from => 'Victor from Pictorical <hey@pictorical.com>', :subject => @subject) do |format|
      format.html
    end
  end


  def reject_artist(email, name, host)
    @subject = "Sorry"
    @name = name
    mail(:to => email, :from => 'Pictorical Team <hey@pictorical.com>', :subject => @subject) do |format|
      format.html
    end
  end

  def welcome(user)
    @user = user
    @url = "http://publisher.pictorical.com" + new_user_session_path
    @subject = "Welcome to Pictorical"
    mail(:to => @user[:email], :subject => @subject) do |format|
      format.html
    end
  end



  def new_user_admin(user)

    @user = user
    @subject = "New user from #{@user.country}, #{@user.first_name} #{@user.last_name}"
    mail(:to => "notifications@pictorical.com", :subject => @subject) do |format|
      format.html
    end

  end

  def new_book_admin(book, change)
    @book = book
    @user = book.user

    if change
      @subject = "Changed book \"#{@book.title}\" (#{@book.words}) for #{@user.first_name} #{@user.last_name}"
    else
      @subject = "New book to \"#{@book.title}\" (#{@book.words}) for #{@user.first_name} #{@user.last_name}"
    end

    mail(:to => "notifications@pictorical.com", :from => "hello@pictorical.com", :subject => @subject) do |format|
      format.html
    end

  end

  def illustration_feedback(illustration)

    @illustration = illustration
    @user = illustration.user

    @subject = "New feedback for your illustrations"

    mail(:to => @user[:email], :subject => @subject) do |format|
      format.html
    end

  end


  def reminder_book_no_illustration(book)
    @book = book
    @user = book.user
    @expiration = (book.created_at.advance :weeks => 2).strftime("%e %B")
    @subject = "We are waiting for your first illustration"

    mail(:to => @user[:email], :subject => @subject) do |format|
      format.html
    end

  end

  def expire_book(book)
    @book = book
    @user = book.user
    @subject = "Your book expired"

    mail(:to => @user[:email], :subject => @subject) do |format|
      format.html
    end

  end



end
