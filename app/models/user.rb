class User < ActiveRecord::Base
 validates :name, :email, :password_digest, presence: true
 has_many :tabs
 has_secure_password
end
