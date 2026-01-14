class AddDiscountToLineItems < ActiveRecord::Migration[8.1]
  def change
    add_column :line_items, :discount, :decimal
  end
end
