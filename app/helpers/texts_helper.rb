module TextsHelper
  def illustrate_or_change
    if @active_book.nil?
      link_to "Illustrate text", :controller => "books", :action => "new", :text_id => @text[:id]
    else
      if @active_book.text[:id] == @text[:id]
        link_to "You are illustrating this book", :controller => "books", :action => "edit", :id => @active_book.id
      else
        link_to "Change to this story", :controller => "books", :action => "change", :text_id => @text[:id]
      end
    end
  end
end
