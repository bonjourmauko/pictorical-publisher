class Book < ActiveRecord::Base
  
  has_many :collections
  has_many  :texts, :through => :collections
  
  belongs_to :principal, :class_name => "Text",  :foreign_key => :principal_text_id
  
  belongs_to  :user
  has_many    :illustrations
  scope       :not_deleted, where(:status => ['active','review','published'])
  scope       :deleted, where(:status => 'destroyed')
  
  after_initialize :status?
  
  
  
  def text
    self.texts.first
  end
  
  def author
    self.texts.first.author
  end
  
  def title
  
    if self.texts.count > 2
      self.principal[:title] + " & Other Stories"
    elsif @texts.count == 2
      self.principal[:title] + " & " + self.texts[1][:title]
    else
      self.principal[:title]
    end
  
  end
  
  
  def content
    
    if self.texts.count == 1
      contents = self.principal.content
    else
      contents = "<h1>#{self.principal.title}</h1>\n\n#{self.principal.content}\n\n"
      self.texts.each do |text|
        unless text == principal
          contents << "<h1>#{text.title}</h1>\n\n#{text.content}\n\n"
        end
      end
    end
    
    return contents
    
  end
  
  def illustrations_lower
    sums = 0
    self.texts.each do |text|
      sums = sums + text.illustrations_lower
    end
    return sums
  end
  
  def illustrations_upper
    sums = 0
    self.texts.each do |text|
      sums = sums + text.illustrations_upper
    end
    return sums
  end
  
  def words
    sums = 0
    self.texts.each do |text|
      sums = sums + text.words
    end
    return sums
  end
  
  
  private
  
  def status?
    self.status ||= "active"
  end
  
end
