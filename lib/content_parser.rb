module ContentParser
  def epubeize(book)
    content = Nokogiri::HTML book.content
    
    content.css("p").each do |p|
    end
    
    content.to_html.html_safe
    
  end
end
