class User < ActiveRecord::Base
  attr_protected :admin
  acts_as_authentic do |config|
    config.crypted_password_field = :crypted_password
    config.require_password_confirmation = true
    config.validate_email_field = false
  end
end
