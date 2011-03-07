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
  
  def create_invitation(invitation, host) 
    @invitation = invitation
    @url = "http://" + host + new_user_registration_path
    mail :to => invitation[:email]
  end
end
