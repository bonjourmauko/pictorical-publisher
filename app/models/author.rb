class Author < ActiveRecord::Base
  has_many  :texts
  scope :sorted, order('last_name ASC')
  
  validates_presence_of :name,
                        :last_name
  
  def name_with_initial
    "#{name.first}. #{last_name}"
  end
  
  
end
