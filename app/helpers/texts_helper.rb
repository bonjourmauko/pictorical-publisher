module TextsHelper
  def illustrate_text_link
    
    link_to "illustrate text", :controller => "books", :action => "new", :txt => @text.id

  end
end
