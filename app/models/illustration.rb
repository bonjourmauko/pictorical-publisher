class Illustration < ActiveRecord::Base
  belongs_to  :book
  
  has_attached_file :illustration,
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :bucket => 'publisher_test',
                    :path => ":unique_prefix/:basename.:extension"
end
