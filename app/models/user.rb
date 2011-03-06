class User < ActiveRecord::Base
  has_many          :books
  #after_initialize  :tutorial_mode?
  #before_create     :a_user_exists?
  #before_create     :admin
  after_initialize  :admin?

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

  validates_inclusion_of :email, :on => :create, :in => Invitation.select(:email).map(&:email), :message => "%{value} is not an invited artist"#, :if => :artist?

  private
  
  #cambiar a true despues
  def tutorial_mode?
    self.tutorial_mode ||= false
  end
  
  def admin?
    self.admin ||= false
  end
  
  # check this later
  #def a_user_exists?
  #  @a_user_exists =
  #    if User.all.first.nil?
  #      false
  #    else
  #      true
  #    end
  #end
  
  #def admin
  #  if @a_user_exists
  #    self.admin = false
  #  else
  #    self.admin = true
  #  end
  #end
  
  #def artist?
  #  @a_user_exists
  #end
  
end
