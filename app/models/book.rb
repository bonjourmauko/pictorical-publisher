class Book < ActiveRecord::Base
  belongs_to  :text
  belongs_to  :artist
  has_many    :illustrations
end
