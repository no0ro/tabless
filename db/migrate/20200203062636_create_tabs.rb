class CreateTabs < ActiveRecord::Migration
  def change
    create_table :tabs do |t|
      t.string :name
      t.text :url
      t.text :notes
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
