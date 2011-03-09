class Author < ActiveRecord::Base
  has_many  :texts
  scope :sorted, order('last_name ASC')
  
  validates_presence_of :last_name
  
  # por mientras
  validates_uniqueness_of :last_name
  
  def name_with_initial
    "#{last_name}, #{name}"
  end
  
  
end
