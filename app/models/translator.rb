class Translator < ActiveRecord::Base
  has_many  :texts
  scope     :sorted, order('last_name ASC')

  attr_accessible       :name,
                        :last_name,
                        :country,
                        :defunction

  validates_presence_of :name,
                        :last_name,
                        :country

  #validates_numericality_of :defunction, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => Time.now.year

  def name_with_initial
    "#{last_name}, #{name}"
  end

  def full_name
    if name
      "#{name} #{last_name}"
    else
      "#{last_name}"
    end
  end
end
