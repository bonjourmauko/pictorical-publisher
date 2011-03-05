class Author < ActiveRecord::Base
  has_many  :texts
  scope :sorted, order('last_name ASC')
  
end
