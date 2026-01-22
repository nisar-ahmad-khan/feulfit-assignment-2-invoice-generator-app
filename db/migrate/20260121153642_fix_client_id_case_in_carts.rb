class FixClientIdCaseInCarts < ActiveRecord::Migration[8.1]
  def change
    remove_index :carts, name: "index_carts_on_Client_id" rescue nil
    rename_column :carts, :Client_id, :client_id
    add_index :carts, :client_id
  end
end
