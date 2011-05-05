class User < ActiveRecord::Base
  has_many          :books
  has_many          :illustrations, :through => :books
  scope             :sorted, order('created_at DESC')

  devise            :database_authenticatable,
                    :registerable,
                    :recoverable

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
                    :art_school_where,
                    :art_school_when,
                    :portfolio_url,
                    :twitter,
                    :accepted_license_agreement,
                    :tutorial_mode,
                    :face_file_name,
                    :face_content_type,
                    :face_file_size,
                    :face_file_extension,
                    :face_original_id

  validates         :email,
                    :presence => true,
                    :uniqueness => true,
                    :format => {
                      :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,
                      :on => :create
                    }

  validates_presence_of :password, :on => :create
  validates_confirmation_of :password, :on => :create


  validates_presence_of :first_name,
                        :last_name,
                        :birthdate,
                        :country,
                        :accepted_license_agreement,
                        :address_line_one,
                        :city,
                        :portfolio_url,
                        :paypal_account

  before_create :redeem_invitation

  after_create :send_welcome_email
  
  has_attached_file :face,
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :bucket => 'pictorical_publisher',
                    :path => ":original_id/:style.:file_extension"
  
  
  
  
  # arreglar
  def name
      unless self.artistic_name.length > 0
         "#{self.first_name} #{self.last_name}"
      else
        self.artistic_name
      end
      
  end
  
  def name_with_initial
    if !last_name.nil?
      "#{last_name}, #{first_name}"
    else
      "#{last_name}"
    end
  end
  
  def full_name
    if !artistic_name.nil?
      "#{artistic_name}"
    elsif !last_name.nil?
      "#{first_name} #{last_name}"
    else
      "#{last_name}"
    end
  end
  
  def real_name
    if !last_name.nil?
      "#{first_name} #{last_name}"
    else
      "#{last_name}"
    end
  end
  

  def active_book
    Book.where(:user_id => self.id, :status => "active").first
  end

  def book_under_review
    Book.where(:user_id => self.id, :status => "review").first
  end

  def has_books_under_review?
    !self.book_under_review.nil?
  end

  private

  def validate_on_create #http://ar.rubyonrails.org/classes/ActiveRecord/Validations.html#M000078
    unless Invitation.select(:email).map(&:email).include? email or is_admin
      errors.add("Invitation", "could not be find for that email")
    end

    if is_admin
      self.admin = true
    else
      self.admin = false
    end

  end

  def is_admin
    if User.all.first.nil?
      true
    else
      false
    end
  end

  def redeem_invitation
    unless is_admin
      invitation = Invitation.find_by_email(email)
      invitation.redeemed_at = Time.now
      invitation.save
    end
  end

  def send_welcome_email

    mail = Notifications.welcome(self)
    mail.deliver

    mail_admin = Notifications.new_user_admin(self)
    mail_admin.deliver

  end




end
