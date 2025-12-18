class CreateLineItems < ActiveRecord::Migration[8.1]
  def change
    create_table :line_items do |t|
      t.string :description
      t.integer :quantity
      t.decimal :unit_price
      t.decimal :total_amount
      t.references :invoice, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
