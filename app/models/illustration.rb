class Illustration < ActiveRecord::Base
  belongs_to  :book
  has_one     :user, :through => :book
  scope       :active, where(:deleted => false)

  has_attached_file :image,
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :bucket => 'pictorical_publisher',
                    :path => ":original_id/:style.:file_extension"

end
