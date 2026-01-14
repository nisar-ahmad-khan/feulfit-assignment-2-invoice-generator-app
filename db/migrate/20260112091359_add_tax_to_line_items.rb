class AddTaxToLineItems < ActiveRecord::Migration[8.1]
  def change
    add_column :line_items, :tax, :decimal
  end
end
