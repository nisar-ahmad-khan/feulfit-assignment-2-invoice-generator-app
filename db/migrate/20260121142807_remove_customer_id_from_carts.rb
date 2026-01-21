class RemoveCustomerIdFromCarts < ActiveRecord::Migration[8.1]
  def change
    remove_foreign_key :carts, :customers rescue nil
    remove_column :carts, :customer_id, :integer
  end
end
