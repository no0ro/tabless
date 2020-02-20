class Tab < ActiveRecord::Base
  belongs_to :user
  has_many :tab_categories
  has_many :categories, through: :tab_categories
  validates :name, :url, :notes, presence: true
end
