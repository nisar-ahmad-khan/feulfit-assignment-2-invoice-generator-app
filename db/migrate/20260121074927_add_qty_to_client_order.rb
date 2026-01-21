class AddQtyToClientOrder < ActiveRecord::Migration[8.1]
  def change
    add_column :client_orders, :qty, :integer
  end
end
