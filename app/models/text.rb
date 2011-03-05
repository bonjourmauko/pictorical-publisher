class Text < ActiveRecord::Base
  belongs_to  :author
  has_many    :books
  delegate    :name, :last_name, :to => :author, :prefix => true
  scope       :sorted, order('title ASC')
  
  
  def count_words
    
    # content.scan(/[\w-]+/).size << esta es la funcion. 
    
  end
  
end
