class CreateMenuItems < ActiveRecord::Migration[8.1]
  def change
    create_table :menu_items do |t|
      t.references :menu_category, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.string :image_url
      t.decimal :price
      t.boolean :available

      t.timestamps
    end
  end
end
