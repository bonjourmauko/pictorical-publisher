class Illustration < ActiveRecord::Base
  belongs_to  :book
  
  has_attached_file :image,
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :bucket => 'publisher_test',
                    :path => ":original_id/:style.:file_extension"
  
end
