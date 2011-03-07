class Text < ActiveRecord::Base
  belongs_to    :author
  has_many      :books
  delegate      :name, :last_name, :to => :author, :prefix => true
  scope         :sorted, order('title ASC')
  before_create :count_words
  before_update :count_words
  
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
    [
      ((words.to_f)/300.0),
      (20.0 + ((words.to_f) - 6000.0 )/600.0),
      (30.0 + ((words.to_f)- 12000.0 )/1200.0)
    ].min.round
  end
  
  def illustrations_upper
    ((words.to_f)/300.0).round
  end  
  
  def words_rounded
    (words.to_f/100.0).round * 100
  end
  
  # revisar esto!!
  def available?
    no_active =  self.books.find_by_status("active").nil?
    no_published = self.books.find_by_status("published").nil?
    no_review = self.books.find_by_status("review").nil?   
    no_active && no_published && no_review
  end
  
  def is_active_for_someone?
    !self.books.find_by_status("active").nil? unless self.books.nil?
  end
  
  
  def belongs_to_user?(current_user)
    self.books.first[:user_id] == current_user.id unless self.books.nil?
  end
  
  private
  
  def count_words
    self.words = self.content.scan(/[\w-]+/).size   
  end
  

  
end
