class Illustration < ActiveRecord::Base
  belongs_to  :book
  
  has_attached_file :illustration,
                    :styles => {
                      :thumbnail => "100x100>",
                      :fullsize => "300x300"
                    }, 
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :path => ":attachment/:id/:style/:basename.:extension",
                    :bucket => 'publisher_test',
                    :path => ":attachment/:unique_prefix/:style/:basename.:extension"
end
