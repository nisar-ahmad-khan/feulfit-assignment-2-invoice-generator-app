class CreateOptions < ActiveRecord::Migration[8.1]
  def change
    create_table :options do |t|
      t.references :option_group, null: false, foreign_key: true
      t.string :name
      t.decimal :price

      t.timestamps
    end
  end
end
