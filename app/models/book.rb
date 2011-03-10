class Book < ActiveRecord::Base
  
  has_many :collections
  has_many  :texts, :through => :collections
  
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
      self.texts.first[:title] + " & Other Stories"
    elsif @texts.count == 2
      self.texts.first[:title] + " & " + self.texts[1][:title]
    elsif
      self.texts.first[:title]
    end
  
  end
  
  
  def content
    
    contents = ""
    
    self.texts.each do |text|
      
      contents << "<h1>#{text.title}</h1>\n\n#{text.content}\n\n\n\n\n"
    
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
