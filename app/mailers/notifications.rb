class Notifications < ActionMailer::Base
  
  # definir bien los mails (copywriting)
  def new_book(book)
    @book = book
    @expiration = (Time.now.advance :weeks => 2).strftime("%e %B")
    subject     "You are illustrating #{@book.title}"
    recipients  @book.user[:email]
    from        "hello@pictorical.com"
    sent_on     Time.now   
  end

  def change_book(book)
    @book = book
    subject     "You are now illustrating #{@book.title}"
    recipients  @book.user[:email]
    from        "hello@pictorical.com" 
    sent_on     Time.now   
  end

  def review_book(book)
    @book = book
    subject     "We received #{@book.title}"
    recipients  @book.user[:email]
    from        "hello@pictorical.com"
    sent_on     Time.now    
  end
  
  def publish_book(book)
    @book = book
    subject     "Your book #{@book.title} is published."
    recipients  @book.user[:email]
    from        "hello@pictorical.com"
    sent_on     Time.now
  end
  
  def create_invitation(invitation, host) 
    @invitation = invitation
    @url = "http://" + host + new_user_registration_path
    subject     "Good news from Pictorical"
    recipients  @invitation[:email]
    from        "hello@pictorical.com"
    sent_on     Time.now
  end
  
  def welcome(user)
    @user = user
    @url = "http://publisher.pictorical.com" + new_user_session_path
    subject     "Welcome to Pictorical"
    recipients  @user[:email]
    from        "hello@pictorical.com"
    sent_on     Time.now
  end
  
  def end_tutorial(user)
    @user = user
    subject     "You can keep on working in #{@user.active_book.title}"
    recipients  @user[:email]
    from        "hello@pictorical.com"
    sent_on     Time.now
  end
  
end
