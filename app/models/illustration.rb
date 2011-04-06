class Illustration < ActiveRecord::Base
  belongs_to  :book
  
  has_attached_file :inline,
                    :styles => {
                      :i180w => "",
                      :i180w => "",
                      :i180w => ""
                    },
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :bucket => 'publisher_test',
                    :path => ":original_id/:style.:extension"
  
  #validates_attachment_presence     :illustration
  #validates_attachment_size         :illustration, :less_than => 10.megabytes
  #validates_attachment_content_type :illustration, :content_type => ["image/png"]
  
end
