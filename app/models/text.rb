class Text < ActiveRecord::Base
  belongs_to    :author
  has_many      :books
  delegate      :name, :last_name, :to => :author, :prefix => true
  scope         :sorted, order('title ASC')
  before_create :count_words
  
  attr_accessible       :title,
                        :author_id,
                        :content,
                        :words,
                        :source
  
  validates_presence_of :title,
                        :author_id,
                        :content,
                        :source
  
  
  def pages
    [(words.to_f)/(320.to_f),1.0].max.round
  end
  
  def illustrations_lower
    ((words.to_f)/500.0).round
  end
  
  def illustrations_upper
    ((words.to_f)/300.0).round
  end  
  
  def words_rounded
    (words.to_f/100).round * 100
  end
  
  
  private
  
  def count_words
    self.words = self.content.scan(/[\w-]+/).size   
  end
  

  
end
