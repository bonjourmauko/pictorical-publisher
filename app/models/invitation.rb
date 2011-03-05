class Invitation < ActiveRecord::Base
  
  scope :sorted, order('id DESC')
  
  
end
