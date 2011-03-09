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
  
  private
  
  def status?
    self.status ||= "active"
  end
  
end
