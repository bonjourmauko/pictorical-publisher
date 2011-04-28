class Text < ActiveRecord::Base
  extend Copyright

  belongs_to        :author
  belongs_to        :translator
  has_many          :collections
  has_many          :books, :through => :collections

  delegate          :name, :last_name, :to => :author, :prefix => true
  scope             :sorted, order('title ASC')
  scope             :not_deleted, where(:deleted => false)
  scope             :deleted, where(:deleted => true)
  scope             :available, where(:availability => true)
  after_initialize  :deleted?
  before_create     :count_words
  before_update     :count_words

  attr_accessible       :title,
                        :author_id,
                        :translator_id,
                        :content,
                        :words,
                        :source,
                        :deleted,
                        :availability,
                        :published,
                        :renewal,
                        :translation_published,
                        :translation_renewal,
                        :public_domain_anyway,
                        :public_domain_anyway_comment

  validates_presence_of :title,
                        :author_id,
                        :content,
                        :source
  
  #validates_presence_of :published, :on => :create
                        
  #validates_numericality_of :published,             :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => Time.now.year
  #validates_numericality_of :renewal,               :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => Time.now.year
  #validates_numericality_of :translation_published, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => Time.now.year
  #validates_numericality_of :translation_renewal,   :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => Time.now.year


  #por alguna razón los textos se duplican
  validates_uniqueness_of :title, :scope => :author_id
  
  def copyright_status
    Text.copyright_status_of self
  end
  
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

  def deleted?
    self[:deleted] ||= false
  end

  def count_words
    self.words = self.content.scan(/[\w-]+/).size
  end
end
