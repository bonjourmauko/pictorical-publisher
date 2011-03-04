module TextsHelper
  def illustrate_or_change
    active_book = current_user.books.where(:status => 'active').first
    if active_book.nil?
      link_to "Illustrate text", :controller => "books", :action => "new", :text_id => @text[:id]
    end
  end
end
