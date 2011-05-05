class Book < ActiveRecord::Base
  extend ContentParser

  has_many  :illustrations
  has_many  :collections
  has_many  :texts, :through => :collections

  belongs_to :principal, :class_name => "Text",  :foreign_key => :principal_text_id

  belongs_to  :user
  delegate    :id, :email, :first_name, :last_name, :tutorial_mode, :paypal_account, :to => :user, :prefix => true

  has_many    :illustrations
  scope       :not_deleted, where(:status => ['active','review','published'])
  scope       :deleted,     where(:status => 'destroyed')
  scope       :sorted,      order('created_at DESC')
  scope       :active,      where(:status => 'active')

  after_initialize :status?

  def epubeized
    Book.epubeize self
  end

  def text
    self.texts.first
  end

  def author
    self.texts.first.author
  end

  def title
    if self.texts.count > 2
      self.principal.title.strip + " & Other Stories"
    elsif self.texts.count == 2
      self.principal.title.strip + " & " + self.texts[1].title.strip
    else
      self.principal.title.strip
    end
  end

  def content
    contents = "<h1>#{self.principal.title}</h1>\n\n#{self.principal.content}\n\n"
    self.texts.each do |text|
      unless text == principal
        contents << "<h1>#{text.title}</h1>\n\n#{text.content}\n\n"
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
