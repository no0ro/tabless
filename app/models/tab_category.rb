class TabCategory < ActiveRecord::Base
  belongs_to :tab
  belongs_to :category
end
