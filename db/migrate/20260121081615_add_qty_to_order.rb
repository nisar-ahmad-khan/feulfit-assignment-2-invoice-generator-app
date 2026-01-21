class AddQtyToOrder < ActiveRecord::Migration[8.1]
  def change
    add_column :orders, :qty, :integer
  end
end
