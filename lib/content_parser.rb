module ContentParser
  
  def epubeize(book)
    @content        = create_nokogiri_object(book.content, "utf-8")    
    caps            = get_illustrations(book, "cap")
    inlines         = get_illustrations(book, "inline")
    cap_position    = 1
    inline_position = 1
    
    @content.css("p").each do |node|
      case node
      when node[:class] == "first"
        div = Nokogiri::XML::Node.new "div", content
        div[:class] = "initial7"
        node.add_previous_sibling div      
        add_img(div, caps.where(:position => cap_position))
        node.content = node.content[1..-1]
        cap_position += 1        
      else
        inlines.each do |illustration|
          offset = position_offset(node, illustration, inline_position)
          add_sibling(node, offset, "p") if offset
        end
        inline_position += 1
      end
    end

    @content.css("blockquote").each do |node|
      add_child(node, "p")
    end
    
    wrap_content("blockquote", "div", "block")
    
    html = @content.to_html
    html = correct_markup(html)
    html
  end
  
  def create_nokogiri_object(html, encoding)
    content = Nokogiri::HTML html
    content.encoding = encoding
    content
  end
  
  def get_illustrations(book, tipe)
    illustrations = book.illustrations.active.where(:tipe => tipe).order('position ASC')
    illustrations
  end
  
  def add_img(parent, illustration)
      img = Nokogiri::XML::Node.new "img", @content
      img[:src] = "images/#{illustration[:tipe]}_#{illustration[:position]}_#{illustration[:image_original_id]}.#{illustration[:image_file_extension]}"
      img[:alt] = "illustration"
      img.parent = parent
  end
  
  def add_sibling(node, where, tag, params)
    _node = eval "Nokogiri::XML::Node.new '#{tag}', @content"
    
    params.each do |key, value|
      eval "_node['#{key}'] = '#{value}'"
    end
    
    node.send "add_#{where}_sibling", _node
  end
  
  def add_child(node, child)
    _node = eval "Nokogiri::XML::Node.new '#{child}', @content"
    node.children.each do |child|
      child.parent = _node
    end
    node.send "add_child", _node
  end
  
  def position_offset(node, i, position)
    if i[:position] == position
      "previous"
    elsif i[:position] == position + 1 and @content.css("p").last == node
      "next"
    else
      false
    end
  end
  
  def wrap_content(children, parent, parent_class)
    nodes = @content.css "#{children}"
    wrapper = nodes.wrap("<#{parent} class='#{parent_class}'></#{parent}>")
  end
  
  def correct_markup(html)
    html.gsub!(/<!.*?>/, '')
    html.gsub!(/<.*?html>/, '')
    html.gsub!(/<.*?body>/, '')
    html.gsub!(/\"illustration\">/, '"illustration" />')
    html.gsub!(/<br.*?>/, '<br />') if html =~ /<br.*?>/
    html
  end
  
end
