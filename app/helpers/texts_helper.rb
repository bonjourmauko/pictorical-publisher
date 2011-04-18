module TextsHelper

  def change_to_this_story
     link_to "Change to this story", {:controller => "books", :action => "change", :text_id => @text[:id]}, :class => "illustrate-change-link", :confirm => 'If you change your story, the other story will be available for other artists to illustrate. Are you sure you want to change it?'
  end

  def add_to_your_book
    unless @active_book.nil?
        link_to "Add to your book", {:controller => "books", :action => "add_text", :id => @active_book.id, :text_id => @text[:id]}, :class => "add-text"
   end
  end

  def illustrate_change_or_add
    if @active_book.nil? || @active_book.text.nil?
      link_to "Illustrate text", { :controller => "books", :action => "new", :text_id => @text[:id] }, :class => "illustrate-this-link"
    else
      if @active_book.text[:id] == @text[:id]
        link_to "You are illustrating this book", {:controller => "books", :action => "edit", :id => @active_book.id}, :class => "illustrate-current-link"
      else
        add_to_your_book + " " + change_to_this_story
      end
    end
  end
  
  def copyright_status_of(text)
    copyright = {
      :usa        => by_country(text, "usa"),
      :uk         => by_country(text, "uk"),
      :australia  => by_country(text, "australia"),
      :canada     => by_country(text, "canada")
    }   
  end
  
  private
  
  def by_country(text, country)
    case country
      when "usa"
        if !text[:published].nil? && text[:published] < 1923
          "US"
        elsif !text[:published].nil? && text[:published] > 1923 && text[:published] < 1963 && text[:renewal].nil?
          "US"
        else
          false
        end
      when "uk"
        if !text.author[:defunction].nil? && Time.now.year - text.author[:defunction] > 70
          "UK"
        else
          false
        end
      when "australia"
       if !text.author[:defunction].nil? && text.author[:defunction] < 1955
         "AU"
       else
         false
       end
      when "canada"
        if !text.author[:defunction].nil? && Time.now.year - text.author[:defunction] > 50
          "CA"
        else
          false
        end
    end
  end
  
end
