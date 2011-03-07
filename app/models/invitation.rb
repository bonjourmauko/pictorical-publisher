class Invitation < ActiveRecord::Base
  scope :sorted, order('id DESC')
  
  attr_accessible   :email,
                    :first_name,
                    :last_name,
                    :specially
  
  validates         :email,
                    :presence => true,
                    :uniqueness => true,
                    :format => {
                      :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      :on => :create
                    }
  
  validates_presence_of :first_name,
                        :last_name
  
  
end
