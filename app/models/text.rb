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
                        :source,
                        :deleted
                          
  validates_presence_of :title,
                        :author_id,
                        :content,
                        :source
                        
  #validates_uniqueness_of :title
  
  def pages
    [(words.to_f)/(320.to_f),1.0].max.round
  end
  
  def illustrations_lower
    
    factor = 0.8
    
    ([
      ((words.to_f)/300.0),
      (20.0 + ((words.to_f) - 6000.0 )/600.0),
      (30.0 + ((words.to_f)- 12000.0 )/1200.0)
    ].min * factor).round
  end
  
  def illustrations_upper
    factor = 1.2
    (((words.to_f)/300.0) * factor).round
  end  
  
  def words_rounded
    (words.to_f/100.0).round * 100
  end
  
  # revisar esto!!
  def available?

    self.books.where('status= ? OR status= ? OR status= ?', "review", "active", "published").first.nil?
    
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
