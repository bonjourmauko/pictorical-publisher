class Author < ActiveRecord::Base
  has_many  :texts
  scope     :sorted, order('last_name ASC')

  attr_accessible       :name,
                        :last_name,
                        :country,
                        :defunction
  
  validates_presence_of :last_name,
                        :country


  #validates_numericality_of :defunction, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => Time.now.year

  # por mientras
  validates_uniqueness_of :last_name  
  
  def name_with_initial
    "#{last_name}, #{name}"
  end

end
