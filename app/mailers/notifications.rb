class Notifications < ActionMailer::Base
  default :from => "hello@pictorical.com"
  
  # definir bien los mails (copywriting)
  def new_book(book)
    @book = book
    mail :to => book.user[:email]    
  end

  def change_book(book)
    @book = book
    mail :to => book.user[:email]
  end

  def review_book(book)
    @book = book
    mail :to => book.user[:email]
  end
  
  def publish_book(book)
    @book = book
    mail :to => book.user[:email]
  end
  
  def create_invitation(invitation, host) 
    @invitation = invitation
    @url = "http://" + host + new_user_registration_path
    mail :to => invitation[:email]
  end
  
  def welcome(user)
    @user = user
    @url = "http://publisher.pictorical.com" + new_user_session_path
    mail :to => user[:email]
  end
  
  
  
end
