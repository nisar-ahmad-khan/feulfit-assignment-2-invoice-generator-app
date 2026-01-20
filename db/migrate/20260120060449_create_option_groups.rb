class CreateOptionGroups < ActiveRecord::Migration[8.1]
  def change
    create_table :option_groups do |t|
      t.references :menu_item, null: false, foreign_key: true
      t.string :name
      t.boolean :required
      t.integer :min_selection
      t.integer :max_selection

      t.timestamps
    end
  end
end
