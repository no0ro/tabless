class Tab < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates :name, :url, :notes, presence: true
end
