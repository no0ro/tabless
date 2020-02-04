class Tab < ActiveRecord::Base
  belongs_to :user
  validates :name, :url, :notes, presence: true
end
