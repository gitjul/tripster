class User < ActiveRecord::Base
  attr_protected :admin
  acts_as_authentic do |config|
    config.crypted_password_field = :crypted_password
    config.require_password_confirmation = true
    config.validate_email_field = false
  end
  strip_attributes :except => [:password, :password_confirmation]
  validates :email, :allow_blank => true,
                    :length => {:minimum => 3, :maximum => 254},
                    :uniqueness => true,
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
  validates :bio, :allow_blank => true,
                  :length => { :maximum => 140}
  mount_uploader :avatar, ImageUploader
  has_many :trips
end

