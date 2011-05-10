module ContentParser
  def epubeize(book)
    content = Nokogiri::HTML book.content
    content.encoding = 'utf-8'

    position = 1

    content.css("p").each do |p|
      if p['class'] == "first"
        i = book.illustrations.active.where(:tipe => "cap").first

        div = Nokogiri::XML::Node.new "div", content
        div['class'] = "initial7"
        p.add_previous_sibling div

        img = Nokogiri::XML::Node.new "img", content
        img['src'] = "images/#{i[:tipe]}_#{i[:position]}_#{i[:image_original_id]}.#{i[:image_file_extension]}"
        img['alt'] = "illustration"
        img.parent = div

        p.content = p.content[1..-1]
      else
        book.illustrations.active.each do |i|
          if i[:position] == position and i[:tipe] == "inline"
            _p = Nokogiri::XML::Node.new "p", content
            p.add_previous_sibling _p

            img = Nokogiri::XML::Node.new "img", content
            img['src'] = "images/#{i[:tipe]}_#{i[:position]}_#{i[:image_original_id]}.#{i[:image_file_extension]}"
            img['alt'] = 'illustration'
            img.parent = _p
          elsif i[:position] == position + 1 and i[:tipe] == "inline" and content.search("p").last == p
            _p = Nokogiri::XML::Node.new "p", content
            p.add_next_sibling _p

            img = Nokogiri::XML::Node.new "img", content
            img['src'] = "images/#{i[:tipe]}_#{i[:position]}_#{i[:image_original_id]}.#{i[:image_file_extension]}"
            img['alt'] = 'illustration'
            img.parent = _p
          end
        end
      position += 1
      end
    end

    content.css("blockquote").each do |blockquote|
      p = Nokogiri::XML::Node.new "p", content
      blockquote.children.each do |child|
        child.parent = p
      end
      blockquote.add_child p
    end
    
    nodes = content.css "blockquote"
    wrapper = nodes.wrap("<div class='block'></div>")
    
    content = content.to_html
    content.gsub!(/<!.*?>/, '').gsub!(/<.*?html>/, '').gsub!(/<.*?body>/, '').gsub!('"illustration">', '"illustration" />')
    content.gsub!("<br>", "<br />") if content =~ /<br.*?>/
    content
  end
end
