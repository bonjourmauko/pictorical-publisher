class Artist < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable

  attr_accessible :email, :password#, :password_confirmation
end
