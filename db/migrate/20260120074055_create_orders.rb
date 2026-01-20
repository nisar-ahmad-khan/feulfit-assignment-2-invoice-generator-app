class CreateOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :orders do |t|
      t.references :client, null: false, foreign_key: true
      t.text :delivery_address
      t.date :delivary_date
      t.time :delivary_time
      t.string :customer_name
      t.integer :phone_number
      t.string :status
      t.decimal :total_price

      t.timestamps
    end
  end
end
