class RemoveCustomerFkFromCarts < ActiveRecord::Migration[8.1]
  def change
     remove_foreign_key :carts, :customers rescue nil
  end
end
