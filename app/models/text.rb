class Text < ActiveRecord::Base
  belongs_to  :author
  has_many    :books
end
