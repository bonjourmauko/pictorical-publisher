class Collection < ActiveRecord::Base
  belongs_to :text
  belongs_to :book
end
