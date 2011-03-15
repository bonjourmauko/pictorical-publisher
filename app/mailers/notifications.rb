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
    mail(:to => @invitation[:email], :return_path => 'Victor from Pictorical <hey@pictorical.com>', :subject => @subject) do |format|
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

  def end_tutorial(user)
    @user = user
    @subject = "You can keep on working in #{@user.active_book.title}"
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





end
