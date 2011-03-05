class Book < ActiveRecord::Base
  belongs_to  :text
  belongs_to  :user
  has_many    :illustrations
  
  after_initialize :status?
  
  private
  
  def status?
    self.status ||= "active"
  end
  
end
