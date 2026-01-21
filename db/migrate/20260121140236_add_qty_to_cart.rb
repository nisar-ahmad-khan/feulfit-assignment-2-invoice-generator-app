class AddQtyToCart < ActiveRecord::Migration[8.1]
  def change
    add_column :carts, :qty, :integer
  end
end
