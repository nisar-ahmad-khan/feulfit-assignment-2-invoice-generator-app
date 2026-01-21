class CreateClientOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :client_orders do |t|
      t.references :client, null: false, foreign_key: true
      t.text :delivary_address
      t.date :delivary_date
      t.time :delivary_time
      t.string :client_name
      t.integer :phone_number
      t.string :status
      t.decimal :total_price

      t.timestamps
    end
  end
end
