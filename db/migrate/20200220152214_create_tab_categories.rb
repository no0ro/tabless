class CreateTabCategories < ActiveRecord::Migration
  def change
      create_table :tab_categories do |t|
        t.integer :category_id
        t.integer :tab_id
    end

  end
end
