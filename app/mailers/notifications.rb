class Notifications < ActionMailer::Base
  
  def new_book(book, change)
    @book = book
    @change = change
    @expiration = (Time.now.advance :weeks => 2).strftime("%e %B")
    if change
      @subject = "You are now illustrating #{@book.title.to_s}"
    else
      @subject = "You are illustrating #{@book.title.to_s}"
    end
    mail(:to => @book.user[:email], :from => "hello@pictorical.com", :subject => @subject) do |format|
      format.html
    end
  end

  def review_book(book)
    @book = book
    @subject = "We received #{@book.title.to_s}"
    mail(:to => @book.user[:email], :from => "hello@pictorical.com", :subject => @subject) do |format|
      format.html
    end
  end
  
  def publish_book(book)
    @book = book
    @subject = "Your book #{@book.title.to_s} has been published"
    mail(:to => @book.user[:email], :from => "hello@pictorical.com", :subject => @subject) do |format|
      format.html
    end
  end
  
  def create_invitation(invitation, host) 
    @invitation = invitation
    @url = "http://" + host + new_user_registration_path
    @subject = "Good news from Pictorical"
    mail(:to => @invitation[:email], :from => "hello@pictorical.com", :subject => @subject) do |format|
      format.html
    end
  end
  
  def welcome(user)
    @user = user
    @url = "http://publisher.pictorical.com" + new_user_session_path
    @subject = "Welcome to Pictorical"
    mail(:to => @user[:email], :from => "hello@pictorical.com", :subject => @subject) do |format|
      format.html
    end
  end
  
  def end_tutorial(user)
    @user = user
    @subject = "You can keep on working in #{@user.active_book.title}"
    mail(:to => @user[:email], :from => "hello@pictorical.com", :subject => @subject) do |format|
      format.html
    end
  end
  
end
