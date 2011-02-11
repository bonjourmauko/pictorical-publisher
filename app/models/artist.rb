class Artist < ActiveRecord::Base
  has_many :books
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable

  attr_accessible :email
                  :password 
                  :password_confirmation
                  
                  :first_name
                  :last_name
                  :birthdate
                  :country
                  
                  :handshake
                  :paypal_account
                  
                  :artistic_name
                  :face_picture_url
                  
                  :address_line_one
                  :address_line_two
                  :city
                  :state
                  :zip
                  :art_school_name
                  :art_school_city
                  :art_school_country
                  :portfolio_url
                  :twitter                  
end
