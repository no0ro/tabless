class User < ActiveRecord::Base
 has_secure_password #:recovery_password, validations: false
 validates :name, :email, :password_digest, presence: true
 has_many :tabs
end
