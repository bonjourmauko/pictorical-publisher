class Notifications < ActionMailer::Base
  default :from => "hello@pictorical.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new.subject
  #
  def new
    


    mail :to => "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.new_book.subject
  #
  def new_book(book)

    @book = book

    mail :to => book.user.email
    
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.change_book.subject
  #
  def change_book
    @greeting = "Hi"

    mail :to => "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notifications.review_book.subject
  #
  def review_book
    @greeting = "Hi"

    mail :to => "to@example.org"
  end
end
