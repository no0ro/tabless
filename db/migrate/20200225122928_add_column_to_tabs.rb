class AddColumnToTabs < ActiveRecord::Migration
  def change
    add_column :tabs, :category_id, :integer
  end
end
