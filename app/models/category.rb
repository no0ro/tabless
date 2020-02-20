class Category < ActiveRecord::Base
  has_many :tab_categories
  has_many :tabs, through: :tab_categories
  has_many :users, through: :tabs
end
