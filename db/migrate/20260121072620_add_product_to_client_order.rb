class AddProductToClientOrder < ActiveRecord::Migration[8.1]
  def change
    add_reference :client_orders, :product, null: false, foreign_key: true
  end
end
