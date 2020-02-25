class Category < ActiveRecord::Base
  has_many :tabs
  has_many :users, through: :tabs
end
