class RemindersController < ApplicationController
  
  
  def index
  end
  
  
  def book_no_illustration
    if current_user.admin?
      @books = []
      Book.active.each do |book|
        if book.illustrations.active.count == 0
        
          user = book.user
          last = user.last_book_no_illustration_reminder_at || book.created_at
          next_reminder = last.advance(:days => 5)
        
          if next_reminder < Time.now
            mail = Notifications.reminder_book_no_illustration(book)
            if mail.deliver #sends the mail
              #updates the last illustration mail sent time
              user.last_book_no_illustration_reminder_at = Time.now
              user.save
            end
          
          end
          @books << book
        end
      end
    else
      redirect_to :root
    end
    
  end
  
  #last.advance(:minutes => 2)
  
end
