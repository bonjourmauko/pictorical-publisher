class Text < ActiveRecord::Base
  belongs_to  :author
  has_many    :books
  delegate    :name, :last_name, :to => :author, :prefix => true
  scope       :sorted, order('title ASC')
end
