class Text < ActiveRecord::Base
  belongs_to    :author
  has_many      :books
  delegate      :name, :last_name, :to => :author, :prefix => true
  scope         :sorted, order('title ASC')
  #before_create :count_words
  
  attr_accessible       :title,
                        :author_id,
                        :content,
                        :words,
                        :source
  
  validates_presence_of :title,
                        :author_id,
                        :content,
                        :source
  
  private
  
  def count_words
    self.words = self.content.scan(/[\w-]+/).size   
  end
  
end
