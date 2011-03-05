module TextsHelper
  def illustrate_or_change
    if @active_book.nil?
      link_to "Illustrate text", :controller => "books", :action => "new", :text_id => @text[:id]
    else
      link_to "Change to this story", :controller => "books", :action => "change", :text_id => @text[:id]
    end
  end
end
