class Book < ActiveRecord::Base
  belongs_to  :text
  belongs_to  :user
  has_many    :illustrations
  scope       :not_deleted, where(:status => ['active','review','published'])
  scope       :deleted, where(:status => 'destroyed')
  
  after_initialize :status?
  
  private
  
  def status?
    self.status ||= "active"
  end
  
end
