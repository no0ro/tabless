class User < ActiveRecord::Base
 has_secure_password
 validates :name, :email, :password_digest, presence: true
 has_many :tabs
 has_many :categories, through: :tabs 
end
