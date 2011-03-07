class Notifications < ActionMailer::Base
  default :from => "hello@pictorical.com"

  def new_book(book)
    @book = book
    mail :to => book.user[:email]    
  end

  def change_book
    mail :to => book.user[:email]
  end

  def review_book
    mail :to => book.user[:email]
  end
end
