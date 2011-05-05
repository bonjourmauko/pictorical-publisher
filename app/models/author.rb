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
    if !name.nil?
      "#{last_name}, #{name}"
    else
      "#{last_name}"
    end
  end
  
  def full_name
    if !name.nil?
      "#{name} #{last_name}"
    else
      "#{last_name}"
    end
  end
  
  def is_defuncted?
    defunction and defunction > 0
  end

end
