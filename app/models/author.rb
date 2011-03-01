class Author < ActiveRecord::Base
  has_many  :texts
end
