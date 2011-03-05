class User < ActiveRecord::Base
  has_and_belongs_to_many :roles
  has_many          :books
  after_initialize  :tutorial_mode?
  after_initialize  :is_admin?

  devise            :database_authenticatable,
                    :registerable

  attr_accessible   :email,
                    :password,
                    :password_confirmation,
                    :first_name,
                    :last_name,
                    :birthdate,
                    :country,
                    :terms_of_service,
                    :paypal_account,
                    :artistic_name,
                    :face_picture_url,
                    :address_line_one,
                    :address_line_two,
                    :city,
                    :state,
                    :zip,
                    :art_school_name,
                    :art_school_city,
                    :art_school_country,
                    :portfolio_url,
                    :twitter

  validates         :email,
                    :presence => true,
                    :uniqueness => true,
                    :format => {
                      :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      :on => :create
                    }

  validates         :password,
                    :presence => true,
                    :confirmation => true

  validates_presence_of :password_confirmation,
                        :first_name,
                        :last_name,
                        :birthdate,
                        :country,
                        :terms_of_service

  private
  
  #cambiar a true despues
  def tutorial_mode?
    self.tutorial_mode ||= false
  end
  
  def is_admin?
    self.admin ||=
      if User.all.first.nil?
        true
      else
        false
      end
  end
  
end
