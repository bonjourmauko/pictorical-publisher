class Book < ActiveRecord::Base
  belongs_to  :text
  belongs_to  :user
  has_many    :illustrations
end
