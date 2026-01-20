class CreateMenuCategories < ActiveRecord::Migration[8.1]
  def change
    create_table :menu_categories do |t|
      t.string :name
      t.text :description
      t.integer :position

      t.timestamps
    end
  end
end
