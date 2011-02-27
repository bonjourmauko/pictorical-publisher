module ApplicationHelper
  def title(title)
    content_for :title, title
  end
  
  def stylesheets(*args)
    content_for :head, stylesheet_link_tag(*args)
  end
  
  def javascripts(*args)
    content_for :head, javascript_include_tag(*args)
  end
end
