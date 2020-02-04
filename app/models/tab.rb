class Tab < ActiveRecord::Base
  belongs_to :user
  validate :name, :url, :notes, presence: true
end
