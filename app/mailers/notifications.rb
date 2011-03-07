class Notifications < ActionMailer::Base
  
  # definir bien los mails (copywriting)
  def new_book(book)
    @book = book
    subject     "hello"
    recipients  @book.user[:email]
    from        "hello@pictorical.com"
    sent_on     Time.now   
  end

  def change_book(book)
    @book = book
    subject     "hello"
    recipients  @book.user[:email]
    from        "hello@pictorical.com" 
    sent_on     Time.now   
  end

  def review_book(book)
    @book = book
    subject     "hello"
    recipients  @book.user[:email]
    from        "hello@pictorical.com"
    sent_on     Time.now    
  end
  
  def publish_book(book)
    @book = book
    subject     "hello"
    recipients  @book.user[:email]
    from        "hello@pictorical.com"
    sent_on     Time.now
  end
  
  def create_invitation(invitation, host) 
    @invitation = invitation
    @url = "http://" + host + new_user_registration_path
    subject     "hello"
    recipients  @invitation[:email]
    from        "hello@pictorical.com"
    sent_on     Time.now
  end
  
  def welcome(user)
    @user = user
    @url = "http://publisher.pictorical.com" + new_user_session_path
    subject     "hello"
    recipients  @user[:email]
    from        "hello@pictorical.com"
    sent_on     Time.now
  end
  
  
  
end
