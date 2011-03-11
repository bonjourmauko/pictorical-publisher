module TextsHelper
  
  def change_to_this_story
    
     link_to "Change to this story", {:controller => "books", :action => "change", :text_id => @text[:id]}, :class => "illustrate-change-link", :confirm => 'If you change your story, the other story will be available for other artists to illustrate. Are you sure you want to change it?'
    
  end
  

  
  
  
  def illustrate_change_or_add
    
    if @active_book.nil? || @active_book.text.nil?
      link_to "Illustrate text", { :controller => "books", :action => "new", :text_id => @text[:id] }, :class => "illustrate-this-link"
    else
      if @active_book.text[:id] == @text[:id]
        link_to "You are illustrating this book", {:controller => "books", :action => "edit", :id => @active_book.id}, :class => "illustrate-current-link"
      else
        change_to_this_story
      end
      
      
    end
  end
end
